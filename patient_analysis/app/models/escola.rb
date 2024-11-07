class Escola < ApplicationRecord
  has_many :beneficiarios
  validates :nome_escola, presence: true
end
