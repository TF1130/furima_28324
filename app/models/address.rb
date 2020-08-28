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
  end

  with_options numericality: { other_than: 0 } do
    validates :address_id
    validates :category_id
    validates :item_status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipdate_standard_id
    validates :price
  end

  belongs_to :item_purchase
end
