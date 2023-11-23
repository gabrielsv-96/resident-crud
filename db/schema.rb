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

ActiveRecord::Schema.define(version: 2023_11_23_012216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "postal_code", null: false
    t.string "public_address", null: false
    t.string "adjunct"
    t.string "district", null: false
    t.string "city", null: false
    t.string "state_code", null: false
    t.string "ibge_code"
    t.bigint "resident_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resident_id"], name: "index_addresses_on_resident_id"
  end

  create_table "residents", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "cpf", null: false
    t.string "cns", null: false
    t.string "email", null: false
    t.date "birth_date", null: false
    t.string "phone", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "residents"
end
