class CreateSupervisor < ActiveRecord::Migration[7.2]
  def change
    create_table :supervisors do |t|
      t.string :nome
      t.string :especialidade
      t.string :contato
      t.string :disponibilidade
      t.references :autismia, null: false, foreign_key: true
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :supervisors, :email, unique: true
  end
end
