FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('public/images/test_image.png')), filename: 'test_image.png')
    end

    product_name { Faker::Lorem.words(number: 3).join(' ') }
    product_description { Faker::Lorem.paragraph }
    category_id { Faker::Number.between(from: 2, to: 10) }
    condition_id { Faker::Number.between(from: 2, to: 10) }
    shipping_cost_id { Faker::Number.between(from: 2, to: 10) }
    prefecture_id { Faker::Number.between(from: 2, to: 10) }
    shipping_duration_id { Faker::Number.between(from: 2, to: 10) }
    price { Faker::Number.between(from: 300, to: 9999999) }
  end
end