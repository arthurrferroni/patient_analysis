class CreateReportResumes < ActiveRecord::Migration[6.1]
  def change
    create_table :report_resumes do |t|
      t.references :report, null: false, foreign_key: true
      t.integer :tokens_used
      t.text :content
      t.boolean :deleted, default: false
      t.float :total_time
      t.timestamps
    end
  end
end
