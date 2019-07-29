class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :category_id, :string
    add_column :products, :user_id, :string
  end
end
