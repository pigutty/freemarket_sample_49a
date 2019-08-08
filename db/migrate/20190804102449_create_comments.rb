class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|

      t.integer :user_id,    null:false
      t.integer :product_id, null:false
      t.string  :text,       null:false
    end
  end
end
