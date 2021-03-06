class GroupinvsController < ApplicationController
  before_action :set_groupinv, only: [:show, :edit, :update, :destroy]

  # GET /groupinvs
  # GET /groupinvs.json
  def index
    @search = Groupinv.search(params[:q])
    @groupinvs = @search.result
  end

  # GET /groupinvs/1
  # GET /groupinvs/1.json
  def show
    @comentable = @groupinv
    @comentarios = @comentable.comentarios
    @comentario = Comentario.new
  end

  # GET /groupinvs/new
  def new
    @groupinv = Groupinv.new
  end

  # GET /groupinvs/1/edit
  def edit
  end

  # POST /groupinvs
  # POST /groupinvs.json
  def create
    @groupinv = Groupinv.new(groupinv_params)
    @groupinv.groupinv_usuarios.new(usuario: current_user, administrador: true)
    respond_to do |format|
      if @groupinv.save
        format.html { redirect_to @groupinv, notice: 'Groupinv Guardado' }
        format.json { render :show, status: :created, location: @groupinv }
      else
        format.html { render :new }
        format.json { render json: @groupinv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groupinvs/1
  # PATCH/PUT /groupinvs/1.json
  def update
    respond_to do |format|
      if @groupinv.update(groupinv_params)
        format.html { redirect_to @groupinv, notice: 'Groupinv was successfully updated.' }
        format.json { render :show, status: :ok, location: @groupinv }
      else
        format.html { render :edit }
        format.json { render json: @groupinv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groupinvs/1
  # DELETE /groupinvs/1.json
  def destroy
    @groupinv.destroy
    respond_to do |format|
      format.html { redirect_to groupinvs_url, notice: 'Groupinv was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupinv
      @groupinv = Groupinv.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def groupinv_params
      params.require(:groupinv).permit(:nombre, :personasMin, :personasMax, 
        :montoIngreso, :montoMensual, :imagen, :descripcion, :tipos_inv_id,
        :groupinv_proyectos_attributes => [:proyecto_id])
    end
end
