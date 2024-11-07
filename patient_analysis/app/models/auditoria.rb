class Auditoria < ApplicationRecord
  belongs_to :beneficiario
  belongs_to :supervisor
  validates :data_auditoria, :detalhes, presence: true
end