class AddNameAndUserTypeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nome, :string
    add_column :users, :tipo_de_usuario, :integer
    add_index :users, :tipo_de_usuario
  end
end
