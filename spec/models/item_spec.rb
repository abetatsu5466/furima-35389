require 'rails_helper'
describe ItemsController, type: :request do

  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品登録' do
  context "正しく保存できるとき" do
    it"nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる"do
      expect(@item).to be_valid
     end
    end
   end
   context "保存できないとき" do
    it "商品画像を1枚つけることが必須であること"do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it"商品名が必須であること" do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it"商品の説明が必須であること" do
      @item.details = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Details can't be blank")
    end
    it "カテゴリーの情報が必須であること"do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "商品の状態についての情報が必須であること"do
    @item.status_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it "配送料の負担についての情報が必須であること"do
    @item.cost_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Cost can't be blank")
    end
    it "発送元の地域についての情報が必須であること"do
    @item.prefecture_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "発送までの日数についての情報が必須であること" do
      @item.delivery_day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day can't be blank")
    end
    it "販売価格についての情報が必須であること"do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "販売価格は、¥300~¥9,999,999の間のみ保存可能であること"do
    @item.price = "299"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is invalid")
    end
  end
end