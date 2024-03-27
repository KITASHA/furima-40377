class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
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
      amount: order_params[:item_price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    return if user_signed_in?
    redirect_to new_user_session_path
  end

end
