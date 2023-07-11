FactoryBot.define do
  factory :order_address do

    postal_code { Faker::Number.unique.number(digits: 3).to_s + '-' + Faker::Number.unique.number(digits: 4).to_s }
    prefecture_id { Faker::Number.between(from: 2, to: 47) }
    city { Faker::Address.city }
    address_line1 { Faker::Address.street_address }
    address_line2 { Faker::Address.street_address }
    phone_number { Faker::Number.number(digits: 10) }
    token { "dummy_token" }

  end
end