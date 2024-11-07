class CreateAuditoria < ActiveRecord::Migration[7.2]
  def change
    create_table :auditoria do |t|
      t.references :beneficiario, null: false, foreign_key: true
      t.references :supervisor, null: false, foreign_key: true
      t.date :data_auditoria
      t.text :detalhes
      t.text :conclusao
      t.date :proxima_auditoria

      t.timestamps
    end
  end
end
