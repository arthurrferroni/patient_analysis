class CreateFeedbackEscola < ActiveRecord::Migration[7.2]
  def change
    create_table :feedback_escolas do |t|
      t.references :beneficiario, null: false, foreign_key: true
      t.references :supervisor, null: false, foreign_key: true
      t.date :data_feedback
      t.text :observacoes
      t.string :status_acompanhamento

      t.timestamps
    end
  end
end
