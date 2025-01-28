FactoryBot.define do
  factory :order_form do
    token { 'tok_' + Faker::Alphanumeric.alphanumeric(number: 28) }
    post_code { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    prefecture_id { Faker::Number.within(range: 2..48) }
    Faker::Config.locale = 'ja'
    municipality { Faker::Address.city }
    house_number { Faker::Address.street_address }
    building_name { Faker::Company.name }
    phone_number { Faker::Number.leading_zero_number(digits: 11) }
    item_id { Faker::Number.number(digits: 2) }
  end
end
