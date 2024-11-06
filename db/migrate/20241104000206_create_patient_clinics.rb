class CreatePatientClinics < ActiveRecord::Migration[7.0]
  def change
    create_table :patient_clinics do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :clinic, null: false, foreign_key: true
      t.date :data_inicio
      t.date :data_fim

      t.timestamps
    end

    add_index :patient_clinics, [:patient_id, :clinic_id], unique: true
  end
end