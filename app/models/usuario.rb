class Usuario < ActiveRecord::Base
  
  authenticates_with_sorcery!

  has_many :groupinv_usuarios, dependent: :destroy
  has_many :groupinvs, through: :groupinv_usuarios

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates :email, confirmation: true
  validates :email_confirmation, presence: true
  validates :nombre, presence: true
  
end
