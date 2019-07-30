class RemoveShippingMethodIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :shipping_method_id, :string
    remove_column :products, :shipping_from_id, :string
  end
end
