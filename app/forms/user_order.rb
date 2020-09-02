class UserOrder

  include ActiveModel::Model
  attr_accessor :name, :price, :token, :postcode,
                :prefecture_id, :city, :block, :phone_number,
                :order, :building

  # orderモデルのバリデーション
  validates :token, presence: true
  validates :price, presence: true

  # locationモデルのバリデーション
  with_options presence: true do
    validates :postcode
    validates :prefecture_id
    validates :city
    validates :block
    validates :phone_number
    validates :order_id
  end
    validates :building, :allow_nil

  def save
    order = Order.create(name: name, price: price, token: token, user_id: user_id )
    Location.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, phone_number: phone_number, building: building, order_id: order_id, user_id: user_id)

  end
  # location
  # validates :postcode
  # validates :prefecture_id
  # validates :city
  # validates :block
  # validates :phone_number
  # validates :order
end

  # order
  # validates :building

  # validates :token, presence: true
  # validates :price, presence: true

  # item
  # validates :title, length: { maximum: 40 }
  # validates :text, length: { maximum: 1000 }
  # validates :category_id
  # validates :item_status_id
  # validates :delivery_fee_id
  # validates :prefecture_id
  # validates :shipdate_standard_id
  # validates :price, format: { with: /\A[0-9]+\z/ }
  # validates :image

  