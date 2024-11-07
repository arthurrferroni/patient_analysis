class PlanoSaude < ApplicationRecord
  has_many :beneficiarios
  validates :nome_plano, presence: true
end