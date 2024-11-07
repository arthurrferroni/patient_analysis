class CreateBeneficiariosClinicas < ActiveRecord::Migration[7.2]
  def change
    create_table :beneficiarios_clinicas do |t|
      t.references :beneficiarios, null: false, foreign_key: true
      t.references :clinicas, null: false, foreign_key: true
      t.date :data_inicio
      t.date :data_fim
      t.timestamps
    end
  end
end
