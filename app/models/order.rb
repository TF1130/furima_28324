class Order < ApplicationRecord
  attr_accessor :token
  # orderで設定したバリデーションをuser_orderに引越し
  #  validates :token, presence: true
  #  validates :price, presence: true
  
  belongs_to :user
  belongs_to :item
  has_one :location
end
