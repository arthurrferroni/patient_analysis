class CreateSchoolFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :school_feedbacks do |t|
      t.references :patient, null: false, foreign_key: true
      t.date :data_feedback
      t.text :observacoes
      t.references :supervisor, null: false, foreign_key: true
      t.string :status_acompanhamento

      t.timestamps
    end
  end
end