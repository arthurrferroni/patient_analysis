class CreateSupervisors < ActiveRecord::Migration[7.0]
  def change
    create_table :supervisors do |t|
      t.string :nome
      t.string :especialidade
      t.string :contato
      t.string :disponibilidade
      t.references :autismia, foreign_key: true

      t.timestamps
    end
  end
end