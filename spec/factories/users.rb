FactoryBot.define do
  factory :user do
    nickname                   {Faker::Name.initials(number: 2)}
    email                      {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password                   {"#{password}" + 0.to_s}
    password_confirmation      {"#{password}" + 0.to_s}
    gimei = Gimei.name
    first_name                 {gimei.first.kanji}
    last_name                  {gimei.last.kanji}
    first_name_kana            {gimei.first.katakana}
    last_name_kana             {gimei.last.katakana}
    birth_date                 {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end
