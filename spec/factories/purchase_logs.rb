FactoryBot.define do
  factory :purchase_log do
    association :user
    association :item
  end
end
