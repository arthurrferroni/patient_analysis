class Supervisor < ApplicationRecord
  belongs_to :autismia
  has_many :auditorias
  has_many :reunioes_familiares
  has_many :feedbacks_escola
  validates :nome, :especialidade, presence: true
end