# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_28_081813) do

  create_table "credit_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "token_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "products", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "size_id", null: false
    t.string "brand"
    t.integer "status_id", null: false
    t.boolean "shipping_fee_id", null: false
    t.integer "shipping_date_id", null: false
    t.integer "price", null: false
    t.integer "category_id"
    t.integer "user_id"
    t.integer "prefecture_id", null: false
  end

  create_table "purchases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "purchase_id"
    t.integer "evaluation"
    t.integer "product_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "fk_rails_0d630f0bc7"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "customer_id"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname", null: false
    t.string "family_name", null: false
    t.string "first_name", null: false
    t.string "family_furigana", null: false
    t.string "first_furigana", null: false
    t.integer "birth_year", null: false
    t.integer "birth_month", null: false
    t.integer "birth_day", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "credit_cards", "users"
  add_foreign_key "purchases", "products"
  add_foreign_key "purchases", "users"
end
