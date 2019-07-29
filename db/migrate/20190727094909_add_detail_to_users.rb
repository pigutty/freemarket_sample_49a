class AddDetailToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :family_name, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :family_furigana, :string, null: false
    add_column :users, :first_furigana, :string, null: false
    add_column :users, :birth_day, :date, null: false
  end
end
