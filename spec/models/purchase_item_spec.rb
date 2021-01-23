require 'rails_helper'

RSpec.describe PurchaseItem, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_item = FactoryBot.build(:purchase_item)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@purchase_item).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @purchase_item.postal_code = nil
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
    end
    it 'postal_codeにハイフンがないと保存できないこと' do
      @purchase_item.postal_code = 1_234_567
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include('Postal code is invalid')
    end
    it 'postal_codeが全角だと保存できないこと' do
      @purchase_item.postal_code = '１２３−４５６７'
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include('Postal code is invalid')
    end
    it 'prefecture_idが空だと保存できないこと' do
      @purchase_item.prefecture_id = nil
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
    end
    it 'prefecture_idが1だと保存できないこと' do
      @purchase_item.prefecture_id = 1
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'cityが空だと保存できないこと' do
      @purchase_item.city = nil
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @purchase_item.address = nil
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include("Address can't be blank")
    end
    it 'buildingは空でも保存できること' do
      @purchase_item.building = nil
      expect(@purchase_item).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @purchase_item.phone_number = nil
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが全角だと保存できないこと' do
      @purchase_item.phone_number = '１２３４５６７８９１０'
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberが英数混合だと保存できないこと' do
      @purchase_item.phone_number = '123456789a'
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberが１２桁以上だと保存できないこと' do
      @purchase_item.phone_number = '012345678910'
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberにハイフンがあると保存できないこと' do
      @purchase_item.phone_number = '012-345-6789'
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include('Phone number is invalid')
    end
    it 'tokenが空だと保存できないこと' do
      @purchase_item.token = nil
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include("Token can't be blank")
    end
  end
end
