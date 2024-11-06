class Audit < ApplicationRecord
  belongs_to :patient
  belongs_to :supervisor

  validates :data_auditoria, :detalhes, presence: true
end