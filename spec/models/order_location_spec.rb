require 'rails_helper'

RSpec.describe OrderLocation, type: :model do
  describe '購入情報の保存' do
    before do
      @order_location = FactoryBot.build(:order_location)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_location).to be_valid
    end
    it 'postcodeが空だと保存できないこと' do
      @order_location.postcode = nil
      @order_location.valid?
      expect(@order_location.errors.full_messages).to include("Postcode can't be blank")
    end
    it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_location.postcode = 'aaa'
      @order_location.valid?
      expect(@order_location.errors.full_messages).to include('Postcode is invalid')
    end
    it 'prefecture_idを選択していないと保存できないこと' do
      @order_location.prefecture_id = 0
      @order_location.valid?
      expect(@order_location.errors.full_messages).to include('Prefecture must be other than 0')
    end
    it 'cityが空だと保存できないこと' do
      @order_location.city = nil
      @order_location.valid?
      expect(@order_location.errors.full_messages).to include("City can't be blank")
    end
    it 'blockが空だと保存できないこと' do
      @order_location.block = nil
      @order_location.valid?
      expect(@order_location.errors.full_messages).to include("Block can't be blank")
    end
    it 'tokenが空だと保存できないこと' do
      @order_location.token = nil
      @order_location.valid?
      expect(@order_location.errors.full_messages).to include("Token can't be blank")
    end
    it '電話番号にハイフンがある場合保存できない' do
      @order_location.phone_number = include '1-1'
      @order_location.valid?
      expect(@order_location.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)', 'Phone number is invalid')
    end
    it 'buildingは空でも保存できること' do
      @order_location.building = ''
      expect(@order_location).to be_valid
    end
  end
end
