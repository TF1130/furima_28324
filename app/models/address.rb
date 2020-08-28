class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :item, optional: true

  with_options presence: true do
    validates :title
    validates :text
    validates :address
    validates :category
    validates :item_status
    validates :delivery_fee
    validates :prefecture
    validates :shipdate_standard
  end

  with_options numericality: { other_than: 0 } do
    validates :address_id
    validates :category_
    validates :item_status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipdate_standard_id
  end
end
