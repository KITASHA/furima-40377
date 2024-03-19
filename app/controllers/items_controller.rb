class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Article.new(article_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :item_name, :item_info, :item_category_id, :item_status_id, :fee_status_id, :pretecture_id, :shipping_day_id, :item_price
      )
      .merge(user_id: current_user.id)
  end
end
