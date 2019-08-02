class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.string :token_id, null:false
      t.references :user,null:false
      t.timestamps
    end
  end
end

