require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @order = FactoryBot.create(:order)  
    @address = FactoryBot.build(:address, order_id: @order.id)
  end

  describe '配送先情報の保存' do
    context '保存できる場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@address).to be_valid
      end
    end

    context '保存できない場合' do
      it 'postal_codeが空では保存できない' do
        @address.postal_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeがハイフンなしでは保存できない' do
        @address.postal_code = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code Input correctly")
      end

      it 'prefecture_idが0では保存できない' do
        @address.prefecture_id = 0
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture Select")
      end

      it 'cityが空では保存できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では保存できない' do
        @address.house_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以下では保存できない' do
        @address.phone_number = '123456789'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end
