FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'kkk@gmail.com' }
    password              { '0000aaaa' }
    password_confirmation { password }
    first_name            { 'あああああ' }
    last_name             { 'いいいいい' }
    first_name_kana       { 'アアアアア' }
    last_name_kana        { 'イイイイイ' }
    birthday              { '1942-10-17' }
  end
end
