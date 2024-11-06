class CreateTherapeuticPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :therapeutic_plans do |t|
      t.references :patient, null: false, foreign_key: true
      t.date :data_inicio
      t.date :data_fim
      t.text :objetivos
      t.text :descricao
      t.integer :carga_horaria
      t.string :status

      t.timestamps
    end
  end
end