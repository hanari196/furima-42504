require 'rails_helper'

RSpec.describe "orders/index.html.erb", type: :view do
before do
  @item1 = FactoryBot.create(:item)
  @item2 = FactoryBot.create(:item)
  assign(:item, @item1) 
  assign(:order_address, OrderAddress.new)
end

 it "商品名が表示されている" do
    render template: "orders/index" 

    expect(rendered).to match /#{@item1.title}/
  end

  it "価格が表示されている" do
    render template: "orders/index"

    expect(rendered).to match /#{@item1.price}/
  end
end