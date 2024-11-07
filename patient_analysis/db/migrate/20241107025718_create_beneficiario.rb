class CreateBeneficiario < ActiveRecord::Migration[7.2]
  def change
    create_table :beneficiarios do |t|
      t.string :nome
      t.date :data_nascimento
      t.text :diagnostico
      t.string :responsavel_principal
      t.string :contato_responsavel
      t.date :data_entrada
      t.date :data_saida
      t.string :status
      t.references :escola, null: false, foreign_key: true
      t.references :plano_saude, null: false, foreign_key: true

      t.timestamps
    end
  end
end
