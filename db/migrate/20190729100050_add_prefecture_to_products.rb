class AddPrefectureToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :prefecture_id, :string
  end
end
