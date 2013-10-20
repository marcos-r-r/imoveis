class EmpresasController < InheritedResources::Base
	before_filter :require_user_and_tipo
	
	def atualiza_empresa
     empresa = Empresa.find_by_id(params[:empresa_atual]) 
     session[:empresa_atual] = empresa
     session[:empreendimento_escolhido] = nil
     session[:pavimento_escolhido] = nil
     session[:usuario_escolhido] = nil
     redirect_to (:back)
  end
	def create
	create! { empresas_path }
	if @current_usuario.empresa_id.nil?
		@current_usuario.empresa_id = 1
		@current_usuario.save
	end
		
	end
	
	def update
		update! { empresas_path }
	end
	
	def index
	@empresas_disponiveis = Empresa.find(:all)
	@empresas_disponiveis.delete_at(0)
	index!
	  
	end
	
  
end
