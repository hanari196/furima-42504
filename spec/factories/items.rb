FactoryBot.define do
  factory :item do
    title              { 'MyString' }
    product_contents   { 'MyText' }
    category_id        { 2 }
    condition_id       { 2 }
    shipping_method_id { 2 }
    prefecture_id      { 2 }
    delivery_time_id   { 2 }
    price              { 500 }

    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('spec/fixtures/files/test_image.png')),
        filename: 'test_image.png',
        content_type: 'image/png'
      )
    end
  end
end
