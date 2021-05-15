class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [  :index]
 


  def index
    # @item = Items.includes(:user)
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(items_params)
   if @item.save
    redirect_to root_path
   else
    render :new
   end
  end

  private

  def items_params
    params.require(:item).permit(:title, :details, :category_id, :status_id, :cost_id, :prefecture_id, :delivery_day_id, :price, :image).
    merge(user_id: current_user.id)
  end
end
