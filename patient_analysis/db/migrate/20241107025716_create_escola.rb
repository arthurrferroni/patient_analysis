class CreateEscola < ActiveRecord::Migration[7.2]
  def change
    create_table :escolas do |t|
      t.string :nome_escola
      t.string :endereco
      t.string :telefone
      t.string :email
      t.string :responsavel_escola

      t.timestamps
    end
  end
end
