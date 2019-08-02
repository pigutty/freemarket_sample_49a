class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :category
  # belongs_to_active_hash :user
  belongs_to_active_hash :prefecture
end