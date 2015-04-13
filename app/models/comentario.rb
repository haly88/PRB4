class Comentario < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :comentable, polymorphic: true
end
