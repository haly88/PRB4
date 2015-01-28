class GroupinvUsuario < ActiveRecord::Base
  belongs_to :groupinv
  belongs_to :usuario
end
