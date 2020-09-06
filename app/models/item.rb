class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :item_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipdate_standard

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :category_id
    validates :item_status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipdate_standard_id
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 999_999_999 }
    validates :image
  end

  belongs_to :user
  has_one :order
  has_many :comments
  has_one_attached :image
end
