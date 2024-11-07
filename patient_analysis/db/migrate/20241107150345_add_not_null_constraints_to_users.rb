class AddNotNullConstraintsToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :nome, false
    change_column_null :users, :tipo_de_usuario, false
  end
end
