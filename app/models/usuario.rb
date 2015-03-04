class Usuario < ActiveRecord::Base
  
  authenticates_with_sorcery!

  has_many :groupinv_usuarios, dependent: :destroy
  has_many :groupinvs, through: :groupinv_usuarios

  validates :password, length: { minimum: 3 }
  validates :password, :email, confirmation: true
  validates :password_confirmation, :email_confirmation, presence: true
  validates :email, uniqueness: true
  validates :razon_social, presence: true, if: :es_empresa
  validates :nombre, :apellido, presence: true, unless: :es_empresa

  
end
