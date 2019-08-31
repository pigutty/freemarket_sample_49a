class Product < ApplicationRecord
  validates :name,                    presence: true
  validates :description,             presence: true
  validates :size_id,                 presence: true
  validates :tatus_id,                presence: true
  validates :shipping_method_id,      presence: true
  validates :shipping_fee_id,         presence: true
  validates :shipping_date_id,        presence: true
  validates :price,                   presence: true
  validates :category_grandparent_id, presence: true
  validates :category_parent_id,      presence: true
  validates :category_id,             presence: true
  validates :prefecture_id,           presence: true
  validates :purchase_status_id,      presence: true
end