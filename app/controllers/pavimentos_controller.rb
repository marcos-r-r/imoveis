class PavimentosController < InheritedResources::Base
  before_filter :require_user_and_tipo
  
  def empreendimentos_da_empresa
  unless session[:empresa_atual].nil?
    @empreendimentos_da_empresa = Empreendimento.find_all_by_empresa_id_and_ativo(session[:empresa_atual],true)
    else
    @empreendimentos_da_empresa = Empreendimento.find_all_by_empresa_id_and_ativo(@current_usuario.empresa_id,true)
    end
  end
  
  def new
    empreendimentos_da_empresa
    new!
  end
  
  def index
    empreendimentos_da_empresa
    unless session[:empreendimento_escolhido].nil?
    @pavimentos_do_empreendimento = Pavimento.find_all_by_empreendimento_id(session[:empreendimento_escolhido])
    else
    @pavimentos_do_empreendimento = Pavimento.find_all_by_empreendimento_id(@empreendimentos_da_empresa.first)
    end
    index!
  end
  
  def edit
    empreendimentos_da_empresa
    edit!
  end
  
  def pavimentos_empreendimento
    puts "BBBBBBBBBBBBBBBBBBBBBBBBBB"
    @empreendimento_escolhido = Empreendimento.find_by_id(params[:empreendimento_id]) 
    session[:empreendimento_escolhido] = @empreendimento_escolhido.id
    redirect_to (:back)
  
    #@pavimentos_do_empreendimento = Pavimento.find_all_by_empreendimento_id(params[:pavimentos_collection])
   
  end
  
  def outra_session
    session[:outra_session] = "outra sessio"
    redirect_to "/"
  end
  
  def create
    create! { pavimentos_path }
  end
  
  def update
    update! { pavimentos_path }
  end
  
  def destroy
    destroy!
    session[:pavimento_escolhido] = nil
  end
end