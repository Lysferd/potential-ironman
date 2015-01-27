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

ActiveRecord::Schema.define(version: 20150107023908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "activities", force: true do |t|
    t.string   "label"
    t.text     "description"
    t.datetime "date_start"
    t.datetime "date_end"
    t.integer  "commissioning_id"
    t.integer  "user_id"
    t.boolean  "completed",        default: false
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
    t.string   "cnpj"
    t.string   "address1"
    t.string   "address2"
    t.string   "zip_code"
    t.string   "phone"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "commercial_contact"
    t.string   "homepage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commissionings", force: true do |t|
    t.string   "label"
    t.text     "description"
    t.integer  "commissioners", default: [],    array: true
    t.integer  "creator_id"
    t.boolean  "authorized",    default: false
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
    t.string   "homepage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "platforms", force: true do |t|
    t.string   "label"
    t.string   "version"
    t.text     "description"
    t.integer  "manufacturer_id"
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
    t.string   "version"
    t.text     "description"
    t.integer  "product_whitelist",    default: [], array: true
    t.integer  "platform_whitelist",   default: [], array: true
    t.integer  "product_dependencies", default: [], array: true
    t.integer  "product_type_id"
    t.integer  "manufacturer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.hstore   "rules",      default: {}, null: false
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

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
    t.string   "name"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "ctps"
    t.string   "ci"
    t.string   "cpf"
    t.string   "pis"
    t.string   "reg"
    t.string   "auth_token"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
