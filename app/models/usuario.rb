class Usuario < ActiveRecord::Base
  
  authenticates_with_sorcery!

  has_many :groupinv_usuarios, dependent: :destroy
  has_many :groupinvs, through: :groupinv_usuarios
  has_many :proyectos

  validates :password, length: { minimum: 3 }, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email, uniqueness: true, on: :create
  #validates :razon_social, presence: true, if: :es_empresa
  #validates :nombre, :apellido, presence: true, unless: :es_empresa

  mount_uploader :imagen, ImagenUploader

  
end
