class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text         :text                       , null: false
      t.string       :title                      , null: false
      t.integer      :price                      , null: false
      t.string       :user_id                    , null: false
      t.integer      :prefecture_id              , null: false
      t.integer      :category_id                , null: false
      t.integer      :item_status_id             , null: false
      t.integer      :delivery_fee_id            , null: false
      t.integer      :shipdate_standard_id       , null: false
      t.timestamps
    end
  end
end
