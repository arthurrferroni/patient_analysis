class CreateProfissional < ActiveRecord::Migration[7.2]
  def change
    create_table :profissionals do |t|
      t.string :nome
      t.string :funcao
      t.string :especialidade
      t.string :contato
      t.string :disponibilidade
      t.references :clinica, null: false, foreign_key: true
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :profissionals, :email, unique: true
  end
end
