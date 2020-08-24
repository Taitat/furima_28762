FactoryBot.define do
  factory :order_information do
    user_id                 { '1' }
    item_id                 { '1' }
    post_code               { '123-4567' }
    prefecture_id           { 2 }
    city                    { 'aaa' }
    address_line            { '1-1-1' }
    building_name           { 'bbb' }
    phone_number            { '08012345678' }
    token                   { Faker::Lorem.characters(number: 50) }
  end
end
