class PatientClinic < ApplicationRecord
  belongs_to :patient
  belongs_to :clinic

  validates :data_inicio, presence: true
end