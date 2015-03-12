class Groupinv < ActiveRecord::Base

	has_many :groupinv_usuarios, dependent: :destroy
	has_many :usuarios, through: :groupinv_usuarios

	has_many :groupinv_proyectos, dependent: :destroy
	has_many :proyectos, through: :groupinv_proyectos

	def full_group
		[nombre, personasMin, personasMax].compact.join(' ')
	end
	
	def usuario_pertenece?(current_user)
		control = false
		usuarios.each do |usuario|
			control = true if usuario == current_user
		end
		control
    end
end
