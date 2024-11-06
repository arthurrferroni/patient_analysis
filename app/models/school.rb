class School < ApplicationRecord
  has_many :patients

  validates :nome_escola, presence: true
end