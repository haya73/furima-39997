class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:index, :create]


  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @orders_addresses = OrdersAddresses.new
    @item = Item.find(params[:item_id])
  end

  def create
    @orders_addresses = OrdersAddresses.new(order_params)
    @item = Item.find(params[:item_id])
    if @orders_addresses.valid?
      pay_item
      @orders_addresses.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:orders_addresses).permit(:post_code, :prefecture_id, :city, 
      :address, :telephone_number, :building, :order)
      .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'            
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

end
