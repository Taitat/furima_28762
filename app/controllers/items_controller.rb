class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def account
    item_price = params[:price]
    add_tax_price = (item_price.to_i * 0.1).floor
    profit = (item_price.to_i * 0.9).floor
    render json: { add_tax_price: add_tax_price, profit: profit }
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :image, :description, :categories_id, :conditions_id, :postage_payers_id,
      :prefecture_id, :handling_times_id, :price
    ).merge(user_id: current_user.id)
  end
end
