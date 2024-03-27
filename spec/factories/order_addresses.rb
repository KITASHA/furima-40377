FactoryBot.define do
  factory :order_address do
    post_code { '123-1234' }
    prefecture_id    { Faker::Number.between(from: 3, to: 47) }
    city             { '千代田区' }
    street           { '有楽町' }
    building         { '鯖' }
    telephone_num    { '1234567891' }
    token {"tok_abcdefghijk00000000000000000"}
    association :user
    association :item
  end
end
