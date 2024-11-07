class CreatePlanoSaude < ActiveRecord::Migration[7.2]
  def change
    create_table :plano_saudes do |t|
      t.string :nome_plano
      t.string :endereco
      t.string :telefone
      t.string :email
      t.string :responsavel_plano

      t.timestamps
    end
  end
end
