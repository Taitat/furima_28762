FactoryBot.define do
  factory :item do
    name                { Faker::Name::initials(number: 2) }
    description         { Faker::Lorem.sentence }
    price               { Faker::Number.between(from:300, to: 9999999) }
    categories_id       {2}
    conditions_id       {2}
    postage_payers_id   {2}
    prefecture_id       {2}
    handling_times_id   {2}
    association :user
    
    
  end
end
