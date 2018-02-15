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

ActiveRecord::Schema.define(version: 20180215125922) do

  create_table "bookings", force: :cascade do |t|
    t.string "car"
    t.boolean "baby_chair"
    t.boolean "navigator"
    t.boolean "accept"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "location_start"
    t.string "location_end"
    t.string "firstname"
    t.string "lastname"
    t.string "middlename"
    t.string "phone"
    t.string "email"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "prava_file_name"
    t.string "prava_content_type"
    t.integer "prava_file_size"
    t.datetime "prava_updated_at"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "car_name"
    t.integer "year"
    t.string "color"
    t.string "transmission"
    t.boolean "is_air"
    t.string "engine_capacity"
    t.boolean "is_electropackage"
    t.string "car_class"
    t.string "car_type"
    t.integer "price_1"
    t.integer "price_2"
    t.integer "price_3"
    t.integer "price_4"
    t.string "price_main"
    t.integer "deposit"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fuel"
    t.integer "number_doors"
    t.boolean "active"
    t.integer "old_price_1"
    t.integer "old_price_2"
    t.integer "old_price_3"
    t.integer "old_price_4"
    t.integer "old_price_5"
    t.integer "price_5"
    t.integer "price_hour"
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["car_id"], name: "index_photos_on_car_id"
  end

  create_table "prices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quick_bookings", force: :cascade do |t|
    t.string "location"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "start_time"
    t.string "end_time"
    t.string "contacts"
    t.string "name"
    t.boolean "is_sedan"
    t.boolean "is_hatch"
    t.boolean "is_cross"
    t.boolean "is_minivan"
    t.boolean "is_universal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "car_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "days"
    t.integer "price"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_reservations_on_car_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "text"
    t.string "name"
    t.string "email"
    t.boolean "active"
    t.integer "star", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "lastname"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean "is_admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "welcomes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
