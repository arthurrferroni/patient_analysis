class CreateEvaluations < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluations do |t|
      t.references :patient, null: false, foreign_key: true
      t.date :data_avaliacao
      t.string :tipo_avaliacao
      t.string :resultado_avaliacao
      t.text :detalhes

      t.timestamps
    end
  end
end