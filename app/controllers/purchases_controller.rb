class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action ::find_item_id, only: [:index, :create]

  def index
    @purchase_item = PurchaseItem.new
    purchase_log = PurchaseLog.where(item_id: @item.id).exists?
    return if (purchase_log == false) && (@item.user_id != current_user.id)

    redirect_to root_path
  end

  def create
    @purchase_item = PurchaseItem.new(purchase_item_params)
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

  def find_item_id
    @item = Item.find(params[:item_id])
  end
end
