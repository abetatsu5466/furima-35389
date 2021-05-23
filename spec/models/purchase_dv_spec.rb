require 'rails_helper'

RSpec.describe PurchaseDv, type: :model do
 
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_dv = FactoryBot.build(:purchase_dv, user_id: user.id, item_id: item.id )  
    sleep(1)
  end
  
  describe '購入履歴' do
   context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_dv).to be_valid
    end
   end

   context '内容に問題がある場合' do
    it 'cityは空では保存できない' do
      @purchase_dv.address = ""
      @purchase_dv.valid?
      expect(@purchase_dv.errors.full_messages).to include("Address can't be blank")
    end

    it 'house_numberは空では保存できない' do
      @purchase_dv.house_number = ""
      @purchase_dv.valid?
      expect(@purchase_dv.errors.full_messages).to include("House number can't be blank")
    end
    
    it 'building_nameは空では保存できない' do
      @purchase_dv.building_name = ""
      @purchase_dv.valid?
      expect(@purchase_dv.errors.full_messages).to include("Building name can't be blank")
    end
    
    it 'postal_codeが空だと保存できないこと' do
      @purchase_dv.postal_code = ""
      @purchase_dv.valid?
      expect(@purchase_dv.errors.full_messages).to include("Postal code can't be blank")
    end
    
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_dv.postal_code = "12345678"
      @purchase_dv.valid?
      expect(@purchase_dv.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it ' postal_codeにーを用いないとないと保存できないこと' do
      @purchase_dv.postal_code = '0000000'
      @purchase_dv.valid?
      expect(@purchase_dv.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it 'prefectureを選択していないと保存できないこと' do
      @purchase_dv.prefecture_id = 0
      @purchase_dv.valid?
      expect(@purchase_dv.errors.full_messages).to include("Prefecture can't be blank")
    end

    it ' phone_number を入力していないと保存できないこと' do
      @purchase_dv.phone_number = nil
      @purchase_dv.valid?
      expect(@purchase_dv.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
    end

    it ' phone_number が９桁以下出ないと保存できないこと' do
      @purchase_dv.phone_number = '000-00000-00000'
      @purchase_dv.valid?
      expect(@purchase_dv.errors.full_messages).to include("Phone number is invalid")
    end

    it 'userが紐付いていないと保存できないこと' do
      @purchase_dv.user_id = nil
      @purchase_dv.valid?
      expect(@purchase_dv.errors.full_messages).to include("User can't be blank")
    end
  end
 end 
end




  
