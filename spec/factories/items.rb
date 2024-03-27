FactoryBot.define do
  factory :item do
    item_name        { '商品' }
    item_info        { 'とても良いもの' }
    item_category_id { Faker::Number.between(from: 2, to: 10) }
    item_status_id   { Faker::Number.between(from: 2, to: 5) }
    fee_status_id    { Faker::Number.between(from: 2, to: 3) }
    prefecture_id    { Faker::Number.between(from: 2, to: 47) }
    shipping_day_id  { Faker::Number.between(from: 2, to: 3) }
    item_price       { Faker::Number.between(from: 300, to: 10_000) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
