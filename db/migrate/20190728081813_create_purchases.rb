class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|

      t.string :purchase_id, null:false
      t.integer :evaluation
      t.integer :product_id, null:false
      t.references :user, null:false
      t.timestamps null:false
    end
    add_foreign_key :purchases, :products
  end
end
