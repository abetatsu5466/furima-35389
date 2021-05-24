class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_new, only: [:index, :create]

  def index
    @purchase_dv = PurchaseDv.new
    if  current_user == @item.user_id
      redirect_to root_path
    end 
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def create
    @purchase_dv = PurchaseDv.new(purchase_params)
    if @purchase_dv.valid?
       pay_item
       @purchase_dv.save
       return  redirect_to root_path
    else
      render :index
    end
    if  current_user == @item.user_id
      redirect_to root_path
    end 
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  private

  def purchase_params
    params.require(:purchase_dv).permit(:postal_code, :prefecture_id, :address, :house_number, :building_name, :phone_number,)
    .merge(user_id: current_user.id ,item_id: params[:item_id], token: params[:token])
  end

  def item_new
    @item = Item.find(params[:item_id])
  end
  
  def pay_item
   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
