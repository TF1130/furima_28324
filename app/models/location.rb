class Location < ApplicationRecord
  # with_options presence: true do
  #   validates :postcode
  #   validates :prefecture_id
  #   validates :city
  #   validates :block
  #   validates :phone_number
  #   validates :order
  # end
  #   validates :building

  belongs_to :order
  
end


## locationテーブル
