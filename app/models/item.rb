class Item < ApplicationRecord
  belongs_to :user
  has_one :item_purchase
  has_many :comments
end
