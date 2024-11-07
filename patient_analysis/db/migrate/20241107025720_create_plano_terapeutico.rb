class CreatePlanoTerapeutico < ActiveRecord::Migration[7.2]
  def change
    create_table :plano_terapeuticos do |t|
      t.references :beneficiario, null: false, foreign_key: true
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
