FactoryBot.define do
  factory :item do
    text { Faker::Lorem.sentence }
    image { Faker::Lorem.sentence }
    title { Faker::Food }
    category_id { "食玩" }
    item_status_id { "美品" }
    delivery_fee_id { "元払い" }
    prefecture_id { "札幌" }
    shipdate_standard_id { "10日後" }
    price { Faker::Lorem.sentence }
    association :user
  end
end
