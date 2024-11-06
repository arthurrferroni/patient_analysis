class CreateFamilyMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :family_meetings do |t|
      t.references :patient, null: false, foreign_key: true
      t.date :data_reuniao
      t.references :supervisor, null: false, foreign_key: true
      t.text :descricao
      t.text :feedback_familiar

      t.timestamps
    end
  end
end