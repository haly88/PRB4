class UsuarioSessionsController < ApplicationController
  
  skip_before_filter :require_login, except: [:destroy]
  
  def new
    @usuario = Usuario.new
  end
  
  def create
    if @usuario = login(params[:email], params[:password], params[:remember_me])
      redirect_back_or_to(root_path, notice: "Se ha logeado con exito.") 
    else
      flash.now[:alert] = "Mail o Password incorrectos"
      render action: :new 
    end
  end
  
  def destroy
    logout
    redirect_to(root_path, notice: 'Se ha deslogeado con exito.')
  end
  
  
end