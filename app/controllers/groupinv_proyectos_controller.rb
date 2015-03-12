class GroupinvProyectosController < ApplicationController

	before_action :set_groupinv_proyecto, only: :destroy

	def create
    @groupinv_proyecto = GroupinvProyecto.new(usuario_id: current_user.id, groupinv_id: params[:groupinv])
	    respond_to do |format|
	      if @groupinv_proyecto.save
	        format.html { redirect_to root_path, notice: 'groupinv_proyecto Guardado' }
	        format.json { render :show, status: :created, location: @groupinv_proyecto }
	      else
	        format.html { render :new }
	        format.json { render json: @groupinv_proyecto.errors, status: :unprocessable_entity }
	      end
	    end
  	end

	def destroy
	@groupinv_proyecto.destroy
		respond_to do |format|
		format.html { redirect_to root_path, notice: 'groupinv_proyecto was successfully destroyed.' }
		format.json { head :no_content }
		end
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupinv_proyecto
    	if params[:usuario].nil?
    		@groupinv_proyecto = GroupinvProyecto.find_by(usuario: current_user.id, groupinv: params[:groupinv])
    	else
    		@groupinv_proyecto = GroupinvProyecto.find_by(usuario: params[:usuario], groupinv: params[:groupinv])
      	end
    end

end