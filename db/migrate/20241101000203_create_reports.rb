class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.references :patient, null: false, foreign_key: true
      t.date :date
      t.text :content

      t.timestamps
    end
  end
end
