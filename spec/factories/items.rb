FactoryBot.define do
  factory :item do
    title { 'テスト商品' }
    product_contents { 'テスト商品の説明' }
    category_id { 2 }
    condition_id { 2 }
    shipping_method_id { 2 }
    prefecture_id { 2 }
    delivery_time_id { 2 }
    price { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('spec/fixtures/test_image.png')), 
        filename: 'test_image.png',
        content_type: 'image/png')
    end
  end
end
