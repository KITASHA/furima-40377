class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity, locals: { item: @item }
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user_id!= current_user.id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
      flash[:notice] = 'Item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity, locals: { item: @item }
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
    item.destroy
    redirect_to root_path
    else
      redirect_to item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :item_name, :item_info, :item_category_id, :item_status_id, :fee_status_id, :pretecture_id, :shipping_day_id, :item_price, :image
    )
          .merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
