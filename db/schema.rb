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

ActiveRecord::Schema.define(version: 20141128163151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.string   "label"
    t.text     "description"
    t.datetime "date_start"
    t.datetime "date_end"
    t.integer  "commissioning_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "certifications", force: true do |t|
    t.string   "label"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "label"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commissionings", force: true do |t|
    t.string   "label"
    t.text     "description"
    t.integer  "active_users", default: [], array: true
    t.integer  "owner_id"
    t.boolean  "authorized"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commissionings_users", id: false, force: true do |t|
    t.integer "commissioning_id"
    t.integer "user_id"
  end

  create_table "manufacturers", force: true do |t|
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "platforms", force: true do |t|
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_types", force: true do |t|
    t.string   "label"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "label"
    t.text     "description"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["type_id"], name: "index_products_on_type_id", using: :btree

  create_table "solutions", force: true do |t|
    t.string   "label"
    t.text     "description"
    t.integer  "commissioning_id"
    t.integer  "product_id"
    t.integer  "platform_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "fullname"
    t.string   "ctps"
    t.string   "ci"
    t.string   "cpf"
    t.string   "pis"
    t.string   "reg"
    t.string   "permission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end