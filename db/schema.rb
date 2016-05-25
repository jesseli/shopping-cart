# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160524062421) do

  create_table "carts", force: true do |t|
    t.integer  "shopper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "carts", ["shopper_id"], name: "index_carts_on_shopper_id"

  create_table "item_carts", force: true do |t|
    t.integer  "quantity"
    t.integer  "item_id"
    t.integer  "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "item_carts", ["cart_id"], name: "index_item_carts_on_cart_id"
  add_index "item_carts", ["item_id"], name: "index_item_carts_on_item_id"

  create_table "item_orders", force: true do |t|
    t.integer  "quantity"
    t.integer  "item_id"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "item_orders", ["item_id"], name: "index_item_orders_on_item_id"
  add_index "item_orders", ["order_id"], name: "index_item_orders_on_order_id"

  create_table "items", force: true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: true do |t|
    t.date     "date"
    t.integer  "shopper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shoppers", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "shoppers", ["email"], name: "index_shoppers_on_email", unique: true
  add_index "shoppers", ["reset_password_token"], name: "index_shoppers_on_reset_password_token", unique: true

end
