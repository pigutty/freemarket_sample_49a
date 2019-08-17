class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|

      t.string :purchase_id
      t.integer :evaluation
      t.integer :product_id
      t.references :user
      t.timestamps
    end
    add_foreign_key :purchases, :products
  end
end
