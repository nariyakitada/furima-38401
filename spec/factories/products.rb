FactoryBot.define do
  factory :product do
    association :user
    
    item_name    {'あああ'}
    explanation  {'あああ'}
    category_id  {'2'}
    situation_id {'2'}
    delivery_id  {'2'}
    area_id      {'2'}
    shipment_id  {'2'}
    price        {'1000'}

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test.image.png'), filename: 'test_image.png')
    end
  end
end
