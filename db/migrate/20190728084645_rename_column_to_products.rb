class RenameColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :size, :size_id
    rename_column :products, :status, :status_id
    rename_column :products, :shipping_fee, :shipping_fee_id
    rename_column :products, :shipping_method, :shipping_method_id
    rename_column :products, :ship_from, :shipping_from_id
    rename_column :products, :shipping_date, :shipping_date_id
  end
end
