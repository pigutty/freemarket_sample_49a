class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :categoryactive
  belongs_to_active_hash :size
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_method
  # belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
end
