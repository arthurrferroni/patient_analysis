class CreateSummaries < ActiveRecord::Migration[7.0]
  def change
    create_table :summaries do |t|
      t.text :content
      t.integer :tokens_used
      t.float :total_time
      t.references :therapeutic_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
