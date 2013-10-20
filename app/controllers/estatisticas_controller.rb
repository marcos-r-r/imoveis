# encoding: utf-8

class EstatisticasController < InheritedResources::Base
  before_filter :require_user_and_tipo
  def escolhe_usuario
    session[:usuario_escolhido] = params[:id]
    p session[:usuario_escolhido] unless session[:usuario_escolhido].nil?

    redirect_to estatisticas_path
  end

  def escolhe_datas
    @data_inicial = params[:data_inicial]
    @data_final = params[:data_final]
    session[:data_inicial] = @data_inicial.to_time.strftime("%Y%m%d")
    session[:data_final] = @data_final.to_time.strftime("%Y%m%d")

    redirect_to estatisticas_path

  end

  def index
    if session[:empresa_atual]
    @empresa_atual = session[:empresa_atual]
    else
    @empresa_atual = Empresa.find(@current_usuario.empresa)
    end

    if session[:usuario_escolhido].nil?
    session[:usuario_escolhido] = @empresa_atual.usuarios.first.id
    end
    @usuarios = @empresa_atual.usuarios

    @data_inicial = session[:data_inicial]
    @data_final = session[:data_final]

    @data_final = Time.now if @data_final.nil?
    @data_inicial = Time.now.beginning_of_month if @data_inicial.nil?

    @usuario = Usuario.find_by_id(session[:usuario_escolhido])
    @dados = Array.new
    @data = Array.new
    @data_cliente = Array.new
    @reservas = Array.new
    @vendidos = Array.new
    @clientes = Array.new
    unless @usuario.nil?
      @historicos_feitos = @usuario.historico_de_contatos.where(:created_at => (@data_inicial.to_time)..(@data_final.to_time.end_of_day))#@data_inicial.to_time, @data_final.to_time])#@data_inicio, @data_final])
      @historicos_vendidos = @usuario.historico_de_contatos.where(:created_at => (@data_inicial.to_time)..(@data_final.to_time.end_of_day))
      @total_vendidos = @historicos_vendidos.group_by{ |t| t.created_at.strftime("%d-%m-%Y")}
      @historicos_final = @historicos_feitos.group_by{ |a| a.created_at.strftime("%d-%m-%Y")}
      @historicos_final.each do |i|
        @dados << i[1].size

        @status = i[1].group_by{ |b| b.status}
        @status.each do |r|
          @reservas << (r[0] == "1" ? r[1].size : 0)
          @vendidos << (r[0] == "2" ? r[1].size : 0)

        end
        @data << i[0].to_time.strftime("%d-%b")
      end

      @clientes_por_usuario = Cliente.where(:usuario_id => (@usuario.id), :created_at => (@data_inicial.to_time)..(@data_final.to_time.end_of_day))#find_all_by_usuario_id(@usuario.id)
      unless @clientes_por_usuario.nil?
        @clientes_por_tempo = @clientes_por_usuario.group_by{ |a| a.created_at.strftime("%d-%m-%Y")}
        @clientes_por_tempo.each do |i|
          @clientes << i[1].size
          @data_cliente << i[0]

        end
      end

      @h = LazyHighCharts::HighChart.new('graph', :style => 'height:300px;width:600px;') do |f|
        f.title(:text => "Negociações do usuario " + @usuario.nome )
        f.options[:rangeSelector] = {:selected=>0};
        f.options[:chart][:defaultSeriesType] = "area"
        f.options[:legend][:layout] = "horizontal"
        f.x_axis(:categories => @data)

        f.series(:type=> 'column', :name=>"Reservas", :data => @reservas)
        f.series(:type=> 'spline', :name=>"Negociação", :data => @dados)
        f.series(:name=>"Vendas", :data => @vendidos)

      end

      @c = LazyHighCharts::HighChart.new('graph', :style => 'height:300px;width:600px;') do |f|
        f.title(:text => "Clientes do usuario " + @usuario.nome )
        f.options[:rangeSelector] = {:selected=>0};
        f.options[:chart][:defaultSeriesType] = "area"
        f.options[:legend][:layout] = "horizontal"
        f.x_axis(:categories => @data_cliente)

        f.series(:type=> 'column', :name=>"Clientes Criados", :data => @clientes)

      end

    end
  end

end