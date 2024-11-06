class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :nome_plano
      t.string :endereco
      t.string :telefone
      t.string :email
      t.string :responsavel_plano

      t.timestamps
    end
  end
end