FactoryBot.define do
  factory :item do
    title { "MyString" }
    product_contents { "MyText" }
    category_id { 1 }
    condition_id { 1 }
    shipping_method_id { 1 }
    prefecture_id { 1 }
    delivery_time_id { 1 }
    price { 1 }
    user { nil }
  end
end
