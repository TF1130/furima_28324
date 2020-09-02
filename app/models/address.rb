class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :item, optional: true

  with_options presence: true do
    validates :title
    validates :text
    validates :address
    validates :category_id
    validates :item_status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipdate_standard_id
    validates :price

    validates :postcode
    validates :prefecture_id#被り| prefecture_id | integer    | null: false                   |
    validates :city
    validates :block
    validates :phone_number
    validates :item_purchase #| item_purchase | references | null: false, foreign_key:true |
  end
    validates :building

          ## addressテーブル
        #| Column        | Type       | Option                        |
        #| ------------- | ---------- | ----------------------------- |
        #| postcode      | string     | null: false                   |
        #| prefecture_id | integer    | null: false                   |
        #| city          | string     | null: false                   |
        #| block         | string     | null: false                   |
        #| building      | string     |                               |
        #| phone_number  | string     | null: false                   |
        #| item_purchase | references | null: false, foreign_key:true |

  belongs_to :order
end
