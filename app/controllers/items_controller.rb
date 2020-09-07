class ItemsController < ApplicationController

  def index #前回作成
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :condition_id, :cost_id, :area_id, :sendout_id, :price, :user_id)
  end

end
