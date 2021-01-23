class PurchasesController < ApplicationController
  def index
    @purchase_item = PurchaseItem.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_item = PurchaseItem.new(purchase_item_params)
    @item = Item.find(params[:item_id])
    if @purchase_item.valid?
      pay_item
      @purchase_item.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_item_params
    params.require(:purchase_item).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :purchase_log_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: purchase_item_params[:token],
      currency: 'jpy'
    )
  end
end
