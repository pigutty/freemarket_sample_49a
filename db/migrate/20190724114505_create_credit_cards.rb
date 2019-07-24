class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|

      t.string :token_id, null:false
      t.string :brand, null:false
      t.integer :exp_month, null:false
      t.integer :exp_year, null:false
      t.string :last4,null:false
      t.references :user,null:false
      t.timestamps
    end
  end
end

