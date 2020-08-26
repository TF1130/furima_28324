class Item < ApplicationRecord
  validates :title              presence: true
  validates :text,              presence: true
  validates :category,          presence: true
  validates :item_status,       presence: true
  validates :delivery_fee,      presence: true
  validates :Prefecture,        presence: true
  validates :ShipDate_Standard, presence: true
  validates :price,             presence: true #価格の範囲が、¥300~¥0,000,000の間であることの設定
  #入力された販売価格によって、非同期的に販売手数料や販売利益が変わること(jsファイルを作成して、JavaScriptを私用して実装する)






  belongs_to :user
  has_one :item_purchase
  has_many :comments
  has_one_attached :image
end