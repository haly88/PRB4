class ComentariosController < ApplicationController
  before_filter :load_comentable

  def index
  	@comentarios = @comentable.comentarios
  end

  def new
    @comentario = @comentable.comentarios.new
  end

  # POST /locations
  # POST /locations.json
  def create
    @comentario = @comentable.comentarios.new(comentario_params)
    respond_to do |format|
      if @comentario.save
        format.html { redirect_to @comentable, notice: 'comentario created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def load_comentable
		klass = [Groupinv].detect { |c| params["#{c.name.underscore}_id"]}
		@comentable = klass.find(params["#{klass.name.underscore}_id"])
	end

	def comentario_params
    params.require(:comentario).permit(:descripcion)
   end
end
