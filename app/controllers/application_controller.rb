class ApplicationController < ActionController::Base
  #protect_from_forgery

	before_filter :controller_and_action_names
  before_filter :lista_empresas

  helper_method :current_usuario

  private
  def current_usuario_session
    return @current_usuario_session if defined? (@current_usuario_session)
    @current_usuario_session = UsuarioSession.find
  end

  def current_usuario
    return @current_usuario if defined? (@current_usuario)
    @current_usuario = current_usuario_session && current_usuario_session.record
    empresa_do_usuario
  end

  def lista_empresas
    @lista_empresas = Empresa.find(:all)
    @lista_empresas.delete_at(0)
  end

  def empresa_do_usuario
    if @current_usuario
    @empresa_do_usuario = Empresa.find_by_id(@current_usuario.empresa_id)
    end
  end

  def require_user
    if Usuario.first
    p current_usuario
      unless current_usuario
      puts "SEM USUARIO LOGADO"
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_usuario_session_url
      return false
      else
        empresa_atual
      end
    end
  end

  def empresa_atual
    if nao_existe_empresa_padrao? and existe_varias_empresas?
        session[:empresa_atual] = @current_usuario.empresa if (@current_usuario.empresa_id.to_i >= 2)
        session[:empresa_atual] = Empresa.find_by_id(@current_usuario.empresa_id.to_i+1) if @current_usuario.empresa_id.to_i == 1
    end


  end

  def nao_existe_empresa_padrao?
    session[:empresa_atual].nil?
  end

  def existe_varias_empresas?
    Empresa.all.count > 1
  end

  def require_user_and_tipo
    require_user
    if current_usuario and usuario_atual_is_vendedor?
      store_location
      flash[:notice] = "Voce nao tem acesso a esse setor"
      puts "TA PASSANDO AQUI"
      redirect_to root_path
    return false
    end
   end


  def usuario_atual_is_vendedor?
    current_usuario.tipo == "Vendedor"
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def verifica_session

  end



	def controller_and_action_names
		@current_controller = controller_name
		@current_action = action_name

	end
end
