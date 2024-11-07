class ReuniaoFamiliar < ApplicationRecord
  belongs_to :beneficiario
  belongs_to :supervisor
  validates :data_reuniao, :descricao, presence: true
end