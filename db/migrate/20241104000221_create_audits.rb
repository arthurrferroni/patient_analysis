class CreateAudits < ActiveRecord::Migration[7.0]
  def change
    create_table :audits do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :supervisor, null: false, foreign_key: true
      t.date :data_auditoria
      t.text :detalhes
      t.text :conclusao
      t.date :proxima_auditoria

      t.timestamps
    end
  end
end