class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    if user_signed_in? && current_user.id == @item.user_id 
      redirect_to root_path
    elsif  @item.order.present?
      redirect_to root_path
    end
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(
      :post_code, :prefecture_id, :city, :street, :building, :telephone_num, :order_id 
    ).merge(
      user_id: current_user.id,
      token: params[:token],
      item_id: params[:item_id],
      item_price: @item.item_price
    )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:item_price], 
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
