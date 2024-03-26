FactoryBot.define do
  factory :user do
    nickname              { 'ジョン' }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 4) + '1a' }
    password_confirmation { password }
    last_name             { '山田'}
    first_name            { '太朗' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { { 1 => 1945, 2 => 6, 3 => 15 } }
  end
end
