class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :item, optional: true
  belongs_to :order
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
    validates :prefecture_id
    validates :city
    validates :block
    validates :phone_number
  end
end
