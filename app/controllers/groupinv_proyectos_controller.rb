class GroupinvProyectosController < ApplicationController

	before_action :set_groupinv_proyecto, only: :destroy

	def new
		@groupinv_proyecto = GroupinvProyecto.new
		@groupinv_proyecto.groupinv_id = params[:groupinv]
	end

	def create
    #@groupinv_proyecto = GroupinvProyecto.new(groupinv_id: params[:groupinv], proyecto_id: params[:proyecto])
    @groupinv_proyecto = GroupinvProyecto.new(groupinv_proyecto_params)
	    respond_to do |format|
	      if @groupinv_proyecto.save
	        format.html { redirect_to groupinv_path(@groupinv_proyecto.groupinv), notice: 'groupinv_proyecto Guardado' }
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
    		@groupinv_proyecto = GroupinvProyecto.find_by(groupinv: params[:groupinv], proyecto: params[:proyecto])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def groupinv_proyecto_params
      params.require(:groupinv_proyecto).permit(:groupinv_id, :proyecto_id)
    end

end