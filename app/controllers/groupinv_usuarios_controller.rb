class GroupinvUsuariosController < ApplicationController

	before_action :set_groupinv_usuario, only: :destroy

	def create
    @groupinv_usuario = GroupinvUsuario.new(usuario: current_user, groupinv_id: params[:groupinv])
	    respond_to do |format|
	      if @groupinv_usuario.save
	        format.html { redirect_to root_path, notice: 'groupinv_usuario Guardado' }
	        format.json { render :show, status: :created, location: @groupinv_usuario }
	      else
	        format.html { render :new }
	        format.json { render json: @groupinv_usuario.errors, status: :unprocessable_entity }
	      end
	    end
  	end

	def destroy
	@groupinv_usuario.destroy
		respond_to do |format|
		format.html { redirect_to root_path, notice: 'groupinv_usuario was successfully destroyed.' }
		format.json { head :no_content }
		end
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupinv_usuario
    	if params[:usuario].nil?
    		@groupinv_usuario = GroupinvUsuario.find_by(usuario: current_user.id, groupinv: params[:groupinv])
    	else
    		@groupinv_usuario = GroupinvUsuario.find_by(usuario: params[:usuario], groupinv: params[:groupinv])
      	end
    end

end