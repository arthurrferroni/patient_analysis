class CreateSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :schools do |t|
      t.string :nome_escola
      t.string :endereco
      t.string :telefone
      t.string :email
      t.string :responsavel_escola

      t.timestamps
    end
  end
end