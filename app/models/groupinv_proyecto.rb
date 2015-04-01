class GroupinvProyecto < ActiveRecord::Base
  	belongs_to :groupinv
  	belongs_to :proyecto

  	validates :groupinv_id, :presence => true
  	validates :proyecto_id, :presence => true
  	validates_uniqueness_of :groupinv_id, :scope => :proyecto_id
end
