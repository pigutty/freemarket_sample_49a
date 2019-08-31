class Product < ApplicationRecord
  has_one :purchase
  has_one :like
  has_many :comments
  belongs_to :user
  has_many_attached :images
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :purchase_status

  validates :name, :description, :status_id, :size_id, :shipping_method_id, :shipping_fee_id, :shipping_date_id, :category_id, :category_grandparent_id, :category_parent_id, :prefecture_id, :purchase_status_id , :price ,presence: true
end
