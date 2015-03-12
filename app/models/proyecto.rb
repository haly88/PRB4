class Proyecto < ActiveRecord::Base

	has_many :groupinv_proyectos, dependent: :destroy
	has_many :groupinvs, through: :groupinv_proyectos

  	belongs_to :usuario
end
