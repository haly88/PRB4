class GroupinvProyectosController < ApplicationController

	before_action :set_groupinv_proyecto, only: :destroy

	def create
    #@groupinv_proyecto = GroupinvProyecto.new(groupinv_id: params[:groupinv], proyecto_id: params[:proyecto])
    @groupinv_proyecto = GroupinvProyecto.new(groupinv_proyecto_params)
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def groupinv_proyecto_params
      params.require(:groupinv_proyecto).permit(:groupinv, :proyecto)
    end

end