class CreateClinica < ActiveRecord::Migration[7.2]
  def change
    create_table :clinicas do |t|
      t.string :nome_clinica
      t.string :endereco
      t.string :telefone
      t.string :email
      t.string :responsavel_clinica

      t.timestamps
    end
  end
end
