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

ActiveRecord::Schema.define(version: 2021_07_01_090018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.bigint "user_id", null: false
    t.datetime "checkin"
    t.datetime "checkout"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "confirmed"
    t.boolean "cancelled"
    t.index ["place_id"], name: "index_bookings_on_place_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "title", null: false
    t.string "type"
    t.text "description", null: false
    t.decimal "price", default: "0.0", null: false
    t.integer "status", null: false
    t.boolean "is_active", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "lon", default: 0.0
    t.float "lat", default: 0.0
    t.string "address"
    t.bigint "user_id"
    t.index ["type"], name: "index_places_on_type"
    t.index ["user_id"], name: "index_places_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "role", default: "consumer", null: false
    t.string "email"
    t.string "encrypted_password"
    t.text "message"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "avatar_url"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "places"
  add_foreign_key "bookings", "users"
end
