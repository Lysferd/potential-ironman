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

ActiveRecord::Schema.define(version: 20141121194047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.string   "label"
    t.text     "description"
    t.datetime "date_start"
    t.datetime "date_end"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "label"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commissionings", force: true do |t|
    t.string   "label"
    t.text     "description"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commissionings", ["client_id"], name: "index_commissionings_on_client_id", using: :btree

  create_table "commissionings_users", id: false, force: true do |t|
    t.integer "commissioning_id"
    t.integer "user_id"
  end

  create_table "plaforms", force: true do |t|
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
    t.integer  "product_id"
    t.integer  "platform_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "solutions", ["platform_id"], name: "index_solutions_on_platform_id", using: :btree
  add_index "solutions", ["product_id"], name: "index_solutions_on_product_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "hashed_password"
    t.integer  "permission"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
