FactoryBot.define do
  factory :user do
    nickname { Faker::Name.unique.first_name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { Faker::Japanese::Name.last_name }
    first_name { Faker::Japanese::Name.first_name }
    last_name_kana { Faker::Japanese::Name.last_name.yomi }
    first_name_kana { Faker::Japanese::Name.first_name.yomi }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end