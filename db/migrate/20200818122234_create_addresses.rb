class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :title                   , null: false
      t.text        :text                    , null: false
      t.integer     :address_id              , null: false
      t.string      :prefecture_id           , null: false
      t.string      :category_id             , null: false
      t.string      :item_status_id          , null: false
      t.string      :delivery_fee_id         , null: false
      t.string      :shipdate_standard_id    , null: false
      t.timestamps
    end
  end
end
