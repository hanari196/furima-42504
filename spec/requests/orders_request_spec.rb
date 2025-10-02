require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:item) { FactoryBot.create(:item) }

  before do
    sign_in user
    allow(Payjp::Charge).to receive(:create).and_return(true)
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_item_order_path(item), headers: { 'ACCEPT' => 'text/html', 'CONTENT_TYPE' => 'text/html' }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'creates a new order' do
      post item_orders_path(item), params: {
        order_address: FactoryBot.attributes_for(
          :order_address, token: 'tok_abcdefghijk00000000000000000'
        )
      }
      expect(response).to redirect_to(root_path)
    end
  end
end
