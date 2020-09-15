class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create

    Payjp::Charge.create(
      amount: @item.price,
      customer: customer_token,
      currency: 'jpy'
      )

  end

end
