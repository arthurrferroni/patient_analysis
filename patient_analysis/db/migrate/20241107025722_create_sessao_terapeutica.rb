class CreateSessaoTerapeutica < ActiveRecord::Migration[7.2]
  def change
    create_table :sessao_terapeuticas do |t|
      t.references :plano_terapeuticos, null: false, foreign_key: true
      t.references :profissional, null: false, foreign_key: true
      t.references :clinica, null: false, foreign_key: true
      t.datetime :data_sessao
      t.text :descricao
      t.text :observacoes

      t.timestamps
    end
  end
end
