require 'rails_helper'

RSpec.describe '購入画面', type: :request do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, title: "テスト商品", price: 1000)
  end

  describe '購入フォーム表示' do
    it 'フォームが正しく表示される' do
      sign_in @user
      get item_orders_path(@item)
      expect(response.body).to include('郵便番号')
      expect(response.body).to include('都道府県')
      expect(response.body).to include('市区町村')
      expect(response.body).to include('番地')
      expect(response.body).to include('建物名')
      expect(response.body).to include('電話番号')
      expect(response.body).to include('id="card-token"')
      expect(response.body).to include('購入')

       expect(response.body).to include('カード情報')
      expect(response.body).to include('有効期限')
      expect(response.body).to include('セキュリティコード')

      expect(response.body).to include('order_address[token]')
      expect(response.body).to include('購入')
    end
  end
end
