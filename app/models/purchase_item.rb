class PurchaseItem
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase_log = PurchaseLog.create(user_id: user_id, item_id: item_id)
    Purchase.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_log_id: purchase_log.id)
  end
end
