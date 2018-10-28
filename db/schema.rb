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

ActiveRecord::Schema.define(version: 20181026085948) do

  create_table "banks", force: :cascade do |t|
    t.string "bank_name"
    t.string "branch_name"
    t.string "account_type"
    t.string "account_number"
    t.string "account_holder"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "serial_number"
    t.string "recipient"
    t.string "title"
    t.integer "total_amount"
    t.date "billing_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sender_id"
    t.integer "bank_id"
    t.integer "user_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "invoice_id"
    t.string "name"
    t.decimal "number", precision: 9, scale: 3
    t.string "unit"
    t.integer "unit_price"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_products_on_invoice_id"
  end

  create_table "senders", force: :cascade do |t|
    t.string "name"
    t.string "telephone"
    t.string "email"
    t.string "postal_code"
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
