class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :delivery_cost_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end
