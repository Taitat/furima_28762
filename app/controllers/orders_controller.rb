class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index,:create,:move_to_index]
  before_action :move_to_index


  def index
    @order = OrderInformation.new
  end

  def create
    @order = OrderInformation.new(
      post_code:          order_params[:post_code],
      prefecture_id:      order_params[:prefecture_id],
      city:               order_params[:city],
      address_line:       order_params[:address_line],
      building_name:      order_params[:building_name],
      phone_number:       order_params[:phone_number],
      item_id:            @item.id,
      user_id:            current_user.id,
    )
    
    if @order.valid?
      ActiveRecord::Base.transaction do
      order_item
      @order.save!
      return redirect_to root_path
      end
    else
      render action: :index
    end

  end

  private

  def order_params
    params.require(:order_information).permit(
      :post_code, :prefecture_id, :city, :address_line, :building_name, :phone_number).merge(token: params[:token])
  end

  def order_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create!(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if Order.exists?(item_id: @item.id)
      redirect_to root_path
    elsif @item.user.id == current_user.id
      redirect_to root_path
    end
  end


end
