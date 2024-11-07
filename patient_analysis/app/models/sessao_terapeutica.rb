class SessaoTerapeutica < ApplicationRecord
  belongs_to :plano_terapeutico
  belongs_to :profissional
  belongs_to :clinica
  validates :data_sessao, :descricao, presence: true
end