class AddDetailToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :family_name, :string
    add_column :users, :first_name, :string
    add_column :users, :family_furigana, :string
    add_column :users, :first_furigana, :string
    add_column :users, :birth_year, :integer
    add_column :users, :birth_month, :integer
    add_column :users, :birth_day, :integer
    add_column :users, :profile, :text
  end
end
