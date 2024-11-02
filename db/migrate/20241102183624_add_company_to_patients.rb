class AddCompanyToPatients < ActiveRecord::Migration[7.0]
  def change
    add_reference :patients, :company, null: false, foreign_key: true
  end
end
