FactoryBot.define do
  factory :user do
    nickname              { Faker::Japanese::Name.last_name }
    email                 { Faker::Internet.email }
    password              {Faker::Internet.password(min_length: 4) + "1a"}
    password_confirmation {password}
    last_name             { Faker::Japanese::Name.last_name }
    first_name            { Faker::Japanese::Name.first_name }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { {1=>1945, 2=>6, 3=>15} }
  end
end
