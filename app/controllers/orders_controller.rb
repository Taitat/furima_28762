class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    binding.pry
  end

  def create
    @order = Order.new(price: order_params[:price])
    if @order.valid?
      order_item
      @order.save
      return redirect_to root_path
    else
      render 'index' 
    end

  end

  private

  def order_params
    params.permit(:price,:token)
  end

  def order_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end

end
