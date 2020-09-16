class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :create]

  def index
    @order = UserOrder.new
    if @item.order.present?
      unless user_signed_in? && @item.user_id != current_user.id
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def create
    @order = UserOrder.new(order_params)
    if @order.valid?
      pay_charge
      @order.save
      return redirect_to root_path
    else
      render "index" 
    end
  end



  private

  def item_find
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:user_order).permit(:card_token, :postcode, :prefecture_id, :city, :number, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_charge
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:card_token],
      currency: 'jpy'
      )
  end

end
