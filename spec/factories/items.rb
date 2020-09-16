FactoryBot.define do
  factory :item do
    name         { 'heya' }
    info         { 'hiroiyo' }
    category_id  { 2 }
    condition_id { 2 }
    cost_id      { 2 }
    area_id      { 2 }
    sendout_id   { 2 }
    price        { 1000 }
    association :user
    image        {Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/test_image.png'), 'image/png')}
    
  end
end
