class GroupinvUsuariosController < ApplicationController

	before_action :set_groupinv_usuario, only: :destroy

	def create
		@groupinv = Groupinv.find(params[:groupinv])
    @groupinv_usuario = @groupinv.groupinv_usuarios.new(usuario: current_user)
	    respond_to do |format|
	      if @groupinv_usuario.save
	        format.html { redirect_to groupinv_path(@groupinv), notice: 'groupinv_usuario Guardado' }
	        format.json { render :show, status: :created, location: @groupinv_usuario }
	      else
	        format.html { redirect_to groupinv_path(@groupinv), notice: 'Error' }
	        format.json { render json: @groupinv_usuario.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  def update
  	@groupinv = Groupinv.find(params[:groupinv])
    @groupinv_usuario = @groupinv.groupinv_usuarios.find_by(usuario: current_user)
    respond_to do |format|
      if @groupinv_usuario.update(proyecto_id: params[:proyecto])
        format.html { redirect_to groupinv_path(@groupinv), notice: 'Voto correcto' }
      else
        format.html { render :edit }
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
  	@groupinv_usuario = GroupinvUsuario.find_by(usuario: params[:usuario], groupinv: params[:groupinv])
  end
end