class Avaliacao < ApplicationRecord
  belongs_to :beneficiario
  validates :data_avaliacao, :tipo_avaliacao, presence: true
end