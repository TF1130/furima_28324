class OrderLocation

  include ActiveModel::Model
  attr_accessor :token,:postcode,
                :prefecture_id, :city, :block, :phone_number,
                :order_id, :building, :item_id, :user_id
  validates :building, absence: true
  with_options presence: true do
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :block
    validates :phone_number, length: { maximum: 11 }, format: {with: /\A[0-9]+\z/ }
    validates :token
  end
  
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Location.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, user_id: user_id, order_id: order_id)
  end
end