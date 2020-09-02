class Item < ApplicationRecord
  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :category_id
    validates :item_status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipdate_standard_id
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 999999999 }
    validates :image
  end

  belongs_to :user
  has_one :order
  has_many :comments
  has_one_attached :image
end
