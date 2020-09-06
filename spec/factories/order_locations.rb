FactoryBot.define do
  factory :order_location do
    postcode { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    block { '西町' }
    phone_number { '09012345678' }
    building { '' }
    token { 'tk0' }
  end
end
