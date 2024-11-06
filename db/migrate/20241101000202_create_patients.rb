class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :nome
      t.date :data_nascimento
      t.string :diagnostico
      t.string :responsavel_principal
      t.string :contato_responsavel
      t.date :data_entrada
      t.string :status
      t.references :school, foreign_key: true
      t.references :company, foreign_key: true # Plano de saúde

      t.timestamps
    end
  end
end