FactoryBot.define do
  factory :purchase_item do
    transient do
      gimei { Gimei.address }
    end
    postal_code { "#{rand(100..999)}-#{rand(1000..9999)}" }
    prefecture_id { Faker::Number.within(range: 2..48) }
    city { gimei.city.kanji }
    address { gimei.town.kanji }
    building { gimei.town.kanji }
    phone_number { Faker::Number.leading_zero_number(digits: 11) }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
