FactoryBot.define do
  factory :item do
    name                { Faker::Name.initials(number: 2) }
    description         { Faker::Lorem.sentence }
    price               { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id       { 2 }
    condition_id       { 2 }
    postage_payer_id   { 2 }
    prefecture_id       { 2 }
    handling_time_id   { 2 }
    association :user
  end
end
