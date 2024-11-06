class CreateProfessionals < ActiveRecord::Migration[7.0]
  def change
    create_table :professionals do |t|
      t.string :nome
      t.string :funcao
      t.string :especialidade
      t.string :contato
      t.string :disponibilidade
      t.references :clinic, foreign_key: true

      t.timestamps
    end
  end
end