class Groupinv < ActiveRecord::Base

	belongs_to :tipos_inv

	has_many :comentarios, as: :comentable

	has_many :groupinv_usuarios, dependent: :destroy
	has_many :usuarios, through: :groupinv_usuarios

	has_many :groupinv_proyectos, dependent: :destroy
	has_many :proyectos, through: :groupinv_proyectos

	mount_uploader :imagen, ImagenUploader

	def usuario_pertenece?(current_user)
		control = false
		usuarios.each do |usuario|
			control = true if usuario == current_user
		end
		control
  end

  def administrador?(usuario)
  	self.groupinv_usuarios.find_by(usuario: usuario).administrador.present? if usuario_pertenece?(usuario)
  end

  def full_group
		[nombre, personasMin, personasMax].compact.join(' ')
	end
end
