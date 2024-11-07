class CreateReuniaoFamiliar < ActiveRecord::Migration[7.2]
  def change
    create_table :reuniao_familiars do |t|
      t.references :beneficiario, null: false, foreign_key: true
      t.references :supervisor, null: false, foreign_key: true
      t.datetime :data_reuniao
      t.text :descricao
      t.text :feedback_familiar

      t.timestamps
    end
  end
end
