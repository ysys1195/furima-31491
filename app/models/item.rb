class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status 
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :detail, presence: true
  validates :category_id,  numericality: { other_than: 1 }
  validates :status_id,  numericality: { other_than: 1 }
  validates :price,  numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :prefecture,  numericality: { other_than: 1 }
  validates :delivery_day_id,  numericality: { other_than: 1 }
end
