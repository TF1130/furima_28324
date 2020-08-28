class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :title                   , null: false
      t.text        :text                    , null: false
      t.integer     :address                 , null: false
      t.integer     :price                   , null: false
      t.timestamps
    end
  end
end
