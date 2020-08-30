FactoryBot.define do
  factory :item do
    text { Faker::Lorem.sentence }
    title { Faker::Food }
    category_id { '食玩' }
    item_status_id { '美品' }
    delivery_fee_id { '元払い' }
    prefecture_id { '札幌' }
    shipdate_standard_id { '10日後' }
    price { 500 }
    association :user
    image_path = File.join(Rails.root, 'public/cats/tomcat1578.jpg')
  end
end
