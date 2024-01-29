class OrdersController < ApplicationController

  def index
    @orders_addresses = OrdersAddresses.new
    @item = Item.find(params[:item_id])
  end

  def create
    @orders_addresses = OrdersAddresses.new(order_params)
    if @orders_addresses.valid?
      @orders_addresses.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:orders_addresses).permit(:post_code, :prefecture_id, :city, 
      :address, :telephone_number, :building, :order).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
