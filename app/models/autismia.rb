class Autismia < ApplicationRecord
  has_many :supervisors

  validates :nome, presence: true
end