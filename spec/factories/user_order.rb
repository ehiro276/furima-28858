FactoryBot.define do
  factory :user_order do
    postcode         { '123-4567' }
    prefecture_id    { 2 }
    city             { '吉田市' }
    number           { '23' }
    building         {  }
    telephone_number { '08012345678' }
    card_token       { 'sample' }
    association :user
    association :item
  end
end