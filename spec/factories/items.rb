FactoryBot.define do
  factory :item do
    name         {'heya'}
    info         {'hiroiyo'}
    category_id  {1}
    condition_id {1}
    cost_id      {1}
    area_id      {1}
    sendout_id   {1}
    price        {1000}
    association :user
  end
end
