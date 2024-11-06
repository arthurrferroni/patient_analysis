class CreateTherapeuticSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :therapeutic_sessions do |t|
      t.references :therapeutic_plan, null: false, foreign_key: true
      t.references :professional, null: false, foreign_key: true
      t.references :clinic, null: false, foreign_key: true
      t.date :data_sessao
      t.text :descricao
      t.text :observacoes

      t.timestamps
    end
  end
end