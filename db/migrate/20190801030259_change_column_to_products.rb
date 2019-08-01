class ChangeColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :prefecture_id, :integer, null: false
    change_column :products, :size_id, :integer
    change_column :products, :shipping_date_id, :integer
    change_column :products, :category_id, :integer
    change_column :products, :user_id, :integer
  end
end
