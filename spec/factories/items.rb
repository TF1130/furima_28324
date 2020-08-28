FactoryBot.define do
  factory :item do
    text { Faker::Lorem.sentence }
    image { Faker::Lorem.sentence }
    title { Faker::Food }
    text { Faker::Lorem.sentence }
    category { Faker::Lorem.sentence }
    item_status { Faker::Lorem.sentence }
    delivery_fee { Faker::Lorem.sentence }
    prefecture { Faker::Address.state }
    shipdate_standard { Faker::Lorem.sentence }
    price { Faker::Lorem.sentence }
    association :user
  end
end
