class PlanoTerapeutico < ApplicationRecord
  belongs_to :beneficiario
  has_many :sessoes_terapeuticas
  validates :data_inicio, :objetivos, presence: true
end
