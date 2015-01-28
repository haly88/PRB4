class Groupinv < ActiveRecord::Base

	has_many :groupinv_usuarios
	has_many :usuarios, through: :groupinv_usuarios

	def full_group
		[nombre, personasMin, personasMax].compact.join(' ')
	end
	
end
