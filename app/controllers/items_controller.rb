class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item_id, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
    @purchase_log = PurchaseLog.all
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

  def show
    @item = Item.find(params[:id])
    @purchase_log = PurchaseLog.all
  end

  def edit
    return if @item.user_id == current_user.id

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    return unless @item.user_id == current_user.id

    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :status_id, :price, :delivery_fee_id, :prefecture_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end

  def find_item_id
    @item = Item.find(params[:id])
  end
end
