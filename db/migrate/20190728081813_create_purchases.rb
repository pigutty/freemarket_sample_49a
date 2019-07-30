class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|

      t.integer :purchase_user_id
      t.integer :purchase_id
      t.integer :evaluation
      t.references :product
      t.references :user
      t.timestamps
    end
  end
end
