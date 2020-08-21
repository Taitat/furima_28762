class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit, item: @item
    end
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

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def set_item
    @item = Item.find(params[:id])
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
      :name, :image, :description, :category_id, :condition_id, :postage_payer_id,
      :prefecture_id, :handling_time_id, :price
    ).merge(user_id: current_user.id)
  end
end
