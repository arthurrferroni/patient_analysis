class User < ApplicationRecord
  has_secure_password
  enum tipo_de_usuario: { default: 0, admin: 1, supervisor: 2, profissional: 3 }

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :nome, presence: true, length: { maximum: 100 }
  validates :tipo_de_usuario, presence: true, inclusion: { in: tipos_de_usuario.keys }

  def admin?
    admin
  end


end