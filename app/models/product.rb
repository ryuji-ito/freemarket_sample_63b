class Product < ApplicationRecord
  has_many :images
  belongs_to :category
  belongs_to :shipping_payer_method
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User'

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :images, length: { minimum: 1, maximum: 10 }
  validates :name, :description, :category_id, :product_condition, :shipping_payer_method_id, :prefecture_id, :days_of_shipping, :price, :seller_id, presence: true
end