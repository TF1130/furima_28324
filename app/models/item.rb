class Item < ApplicationRecord
  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :category
    validates :item_status
    validates :delivery_fee
    validates :Prefecture
    validates :ShipDate_Standard
    validates :price, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/ }
  end

  belongs_to :user
  has_one :item_purchase
  has_many :comments
  has_one_attached :image
end
