class Clinica < ApplicationRecord
  has_many :beneficiarios_clinicas
  has_many :profissionais
  has_many :sessoes_terapeuticas
  validates :nome_clinica, presence: true
end