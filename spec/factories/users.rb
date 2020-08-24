FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirm {password}
    first_name {Gimei.first.kanji}
    family_name {Gimei.last.kanji}
    first_name_kana {Gimei.first.katakana}
    family_name_kana {Gimei.last.katakana}
    date_select {Faker::Date.birthday}
  end
end