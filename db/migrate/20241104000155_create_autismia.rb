class CreateAutismia < ActiveRecord::Migration[7.0]
  def change
    create_table :autismia do |t|
      t.string :nome
      t.string :endereco
      t.string :telefone
      t.string :email
      t.string :responsavel

      t.timestamps
    end
  end
end