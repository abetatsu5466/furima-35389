class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :create, :edit]
  before_action :set_item, only: [:edit, :show, :update]


  def index
    @items = Item.all.order("created_at DESC")
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
    if current_user.id == @item.user_id
      redirect_to edit_item_path
    else
      redirect_to root_path
    end
  end

  def show
  end

  def update
    if @item.update(items_params)
      redirect_to root_path(@prototype)
    else
      render :edit
    end
  end

  private

  def items_params
    params.require(:item).permit(:title, :details, :category_id, :status_id, :cost_id, :prefecture_id, :delivery_day_id, :price, :image).
    merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
