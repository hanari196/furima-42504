require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  let(:user) { FactoryBot.create(:user) }
  let(:item) { FactoryBot.create(:item, title: "テスト商品", price: 1000, user: user) }
  let(:order_address) { OrderAddress.new }

  before do
    assign(:item, item)
    assign(:order_address, order_address)
  end

  it "購入フォームが正しく表示される" do
    render  
  
    # 商品情報の表示
    expect(rendered).to match /テスト商品/
    expect(rendered).to match /1000/

    # カード情報フォーム
    expect(rendered).to have_selector('div#number-form')
    expect(rendered).to have_selector('div#expiry-form')
    expect(rendered).to have_selector('div#cvc-form')

    # 配送先フォーム
    expect(rendered).to have_field('order_address[postal_code]')
    expect(rendered).to have_field('order_address[city]')
    expect(rendered).to have_field('order_address[house_number]')
    expect(rendered).to have_field('order_address[building_name]')
    expect(rendered).to have_field('order_address[phone_number]')
  end
end
