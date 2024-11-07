class CreateAvaliacao < ActiveRecord::Migration[7.2]
  def change
    create_table :avaliacaos do |t|
      t.references :beneficiario, null: false, foreign_key: true
      t.date :data_avaliacao
      t.string :tipo_avaliacao
      t.text :resultado_avaliacao
      t.text :detalhes

      t.timestamps
    end
  end
end
