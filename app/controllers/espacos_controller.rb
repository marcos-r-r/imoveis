class EspacosController < InheritedResources::Base
  before_filter :require_user


  def popula_pavimento_por_empreendimento
    @empreendimento_escolhido = Empreendimento.find_by_id(params[:empreendimento_id])
    session[:empreendimento_escolhido] = @empreendimento_escolhido.id
    popula_lista_por_pavimento
  end

  def popula_pavimento_por_empreendimento_criacao
    @empreendimento_escolhido = Empreendimento.find_by_id(params[:empreendimento_id])
    session[:empreendimento_escolhido] = @empreendimento_escolhido.id
    redirect_to new_espaco.path
  end

  def empreendimento_escolhido
    if Empreendimento.any?
      if session[:empresa_atual]
        @empreendimentos = Empreendimento.find_all_by_empresa_id_and_ativo(session[:empresa_atual].id,true)
      else
        @empreendimentos = Empreendimento.find_all_by_empresa_id_and_ativo(@current_usuario.empresa_id,true)
      end

      unless session[:empreendimento_escolhido].nil?
        @empreendimento_escolhido = Empreendimento.find_by_id(session[:empreendimento_escolhido])
      else
        @empreendimento_escolhido = Empreendimento.find_by_empresa_id(session[:empresa_atual].id)
        session[:empreendimento_escolhido] = @empreendimento_escolhido.id if @empreendimento_escolhido
      end

      @pavimentos = Pavimento.find_all_by_empreendimento_id(@empreendimento_escolhido)
      unless @empreendimento_escolhido.nil?
      @pavimento_escolhido =  Pavimento.find_by_id(session[:pavimento_escolhido]) #Values::PAVIMENTO
      end
    end
  end

  def popula_lista_por_pavimento
    session[:pavimento_escolhido] = nil
    session[:status] = params[:status_id]
    @pavimento_escolhido = Pavimento.find_by_id(params[:pavimento_id])
    if @pavimento_escolhido
    session[:pavimento_escolhido] = @pavimento_escolhido.id
    # else
    # session[:pavimento_escolhido] = @empreendimento_escolhido.pavimentos.first.id if @empreendimento_escolhido.pavimentos.any?
    end
    redirect_to :back
  end

  def index
    empreendimento_escolhido
    if session[:pavimento_escolhido]
      @pavimento_escolhido = Pavimento.find_by_id(session[:pavimento_escolhido])
    end
    if @pavimento_escolhido.nil?
      @pavimento = nil
    else
      @pavimento = @pavimento_escolhido.id
    end

    #puts session[:pavimento_escolhido]
    p @pavimento_escolhido
    if @pavimento_escolhido
    @espacos_do_pavimento = Espaco.find_all_by_pavimento_id(@pavimento_escolhido)
    else
      unless @empreendimento_escolhido.nil?
      @espacos_do_pavimento = Espaco.find_all_by_empreendimento_id(@empreendimento_escolhido)
      else
      @espacos_do_pavimento = []
      end
    end

    index!
  end

  def dashboard
    @status = session[:status]
    empreendimento_escolhido
    puts "Teste de desfaz"
    puts params[:desfaz]
  @desfaz = params[:desfaz]
  if @desfaz
  @espaco_rollback = Espaco.find_by_id(params[:desfaz])
  @espaco_rollback.status = 0
  @espaco_rollback.save
  @desfaz = nil
  end
  session[:vagas] = nil

    if @pavimento_escolhido
    if  @status == "" || @status.nil?
      @espacos_do_pavimento = Espaco.where(:pavimento_id => @pavimento_escolhido, :tipo_de_espaco => "Sala")
    else
      @espacos_do_pavimento = Espaco.where(:pavimento_id => @pavimento_escolhido, :tipo_de_espaco => "Sala", status: @status)
    end
    else
      unless @empreendimento_escolhido.nil?
        if  @status == "" || @status.nil?
          @espacos_do_pavimento = Espaco.where(:empreendimento_id =>@empreendimento_escolhido.id, :tipo_de_espaco => "Sala")
        else
          @espacos_do_pavimento = Espaco.where(:empreendimento_id =>@empreendimento_escolhido.id, :tipo_de_espaco => "Sala", status: @status)
        end  
      else
      @espacos_do_pavimento = []
      end
    end
    respond_to do |format|
      format.html
  format.js {render :content_type => 'text/javascript'}

    end
  end

  def new
    empreendimento_escolhido
    new!
  end

  def edit
    empreendimento_escolhido
    edit! { espacos_path }
  end

  def create
    @espaco = Espaco.new(params[:espaco])
    @espaco.status = 0
    create! { espacos_path }
  end

  def update
    update! { espacos_path }
  end

end
