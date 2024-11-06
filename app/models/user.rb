class User < ApplicationRecord
  # Devise modules para autenticação
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associações
  belongs_to :company
  has_many :patients, dependent: :destroy

  # Validações
  validates :company, presence: true
  validates :name, presence: true
  
  enum role: { admin: 0, company_user: 1, professional: 2, supervisor: 3 }

  def admin?
    role == 'admin'
  end
  
end