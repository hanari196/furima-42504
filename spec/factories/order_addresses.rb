FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 } # 1は有効な都道府県ID
    city { '仙台市泉区' }
    house_number { '1-1' }
    building_name { '市名坂ビル101' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' } # テスト用のカードトークン
  end
end
