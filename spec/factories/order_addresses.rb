FactoryBot.define do
  factory :order_address do

user_id { Faker::Number.unique.between(from: 1, to: 100) }
item_id { Faker::Number.unique.between(from: 1, to: 100) }
postal_code { Faker::Address.postcode }
prefecture_id { Faker::Number.between(from: 1, to: 47) }
city { Faker::Address.city }
address_line1 { Faker::Address.street_address }
phone_number { Faker::Number.number(digits: 10) }
    
  end
end
