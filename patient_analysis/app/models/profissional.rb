class Profissional < ApplicationRecord
  belongs_to :clinica
  has_many :sessoes_terapeuticas
  validates :nome, :funcao, :especialidade, presence: true
end