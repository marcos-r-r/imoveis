class EmpreendimentosController < InheritedResources::Base
	before_filter :require_user_and_tipo
	before_filter :lista_empresas
	
	

	def new
     
	
    	new!
	end
  
  	def edit

	
    	edit!
  	end  
  	def index
  	  @empresas = Empresa.find(:all)
  	  @empresas.delete_at(0)  	  
  	  @empreendimento = Empreendimento.new
  	unless session[:empresa_atual].nil?
    @empreendimentos_da_empresa = Empreendimento.find_all_by_empresa_id(session[:empresa_atual])
    else
    @empreendimentos_da_empresa = Empreendimento.find_all_by_empresa_id(@current_usuario.empresa_id)
    end 
  end
  def create
    create! { empreendimentos_path }
  end
  
  def update
   update! { empreendimentos_path } 
   
  end
  
end
