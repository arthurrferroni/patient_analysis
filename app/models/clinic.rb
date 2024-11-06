class Clinic < ApplicationRecord
  has_many :patient_clinics
  has_many :patients, through: :patient_clinics

  has_many :professionals
  has_many :therapeutic_sessions

  validates :nome_clinica, presence: true
end