class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :patients, dependent: :destroy
  has_many :reports, dependent: :destroy # Se aplicável

  validates :name, presence: true
  validates :address, presence: true
end
