class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :edit_up, only: [ :edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")

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

  def edit
    
  end

  def show
  end

  def update
    if @item.update(items_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def items_params
    params.require(:item).permit(:title, :details, :category_id, :status_id, :cost_id, :prefecture_id, :delivery_day_id, :price, :image).
    merge(user_id: current_user.id, purchase: params[:purchase])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def edit_up
    if current_user.id != @item.user.id 
      redirect_to root_path
    end
  end
end
