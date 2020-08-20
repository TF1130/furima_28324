class AddpasswordConfirmToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_confirm, :string
  end
end
