class AdddateSelectToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :date_select, :date
  end
end
