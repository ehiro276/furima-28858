FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
    first_name            { 'あああああ' }
    last_name             { 'いいいいい' }
    first_name_kana       { 'アアアアア' }
    last_name_kana        { 'イイイイイ' }
    birthday              { '1942-10-17' }
  end
end
