class UsuarioSessionsController < ApplicationController
  # GET /user_sessions
  # GET /user_sessions.json
  


  # GET /user_sessions/new
  # GET /user_sessions/new.json
  def new
    @usuario_session = UsuarioSession.new
    respond_to do |format|
    
      format.html # new.html.erb
      format.json { render json: @usuario_session }
    
    
  end
  end

 
  # POST /user_sessions
  # POST /user_sessions.json
  def create
    @usuario_session = UsuarioSession.new(params[:usuario_session])

    respond_to do |format|
      if @usuario_session.save
        format.html { redirect_to "/", notice: 'User session was successfully created.' }
        format.json { render json: @usuario_session, status: :created, location: @usuario_session }
      else
        format.html { render action: "new" }
        format.json { render json: @usuario_session.errors, status: :unprocessable_entity }
      end
    end
  end

  

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.json
  def destroy
    @usuario_session = UsuarioSession.find(params[:id])
    @usuario_session.destroy
    session[:empresa_atual] = nil
    session[:empreendimento_escolhido] = nil
    session[:pavimento_escolhido] = nil
    session[:vagas] = nil
    respond_to do |format|
      format.html { redirect_to :usuarios }
      format.json { head :ok }
    end
  end
end
