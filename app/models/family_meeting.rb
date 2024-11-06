class FamilyMeeting < ApplicationRecord
  belongs_to :patient
  belongs_to :supervisor

  validates :data_reuniao, :descricao, presence: true
end
