# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_06_183641) do

  create_table "beverages", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chairs", force: :cascade do |t|
    t.string "row"
    t.string "seat"
    t.integer "price"
    t.string "chair_type"
    t.integer "theater_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["theater_id"], name: "index_chairs_on_theater_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_inventories_on_user_id"
  end

  create_table "inventoryproducts", force: :cascade do |t|
    t.integer "quantity"
    t.integer "inventory_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inventory_id"], name: "index_inventoryproducts_on_inventory_id"
    t.index ["product_id"], name: "index_inventoryproducts_on_product_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.datetime "date_in"
    t.datetime "date_out"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orderlines", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_orderlines_on_order_id"
    t.index ["product_id"], name: "index_orderlines_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "productable_type", null: false
    t.integer "productable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["productable_type", "productable_id"], name: "index_products_on_productable"
  end

  create_table "theaters", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "firstname"
    t.string "lastname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "chairs", "theaters"
  add_foreign_key "inventories", "users"
  add_foreign_key "inventoryproducts", "inventories"
  add_foreign_key "inventoryproducts", "products"
  add_foreign_key "orderlines", "orders"
  add_foreign_key "orderlines", "products"
  add_foreign_key "orders", "users"
end
