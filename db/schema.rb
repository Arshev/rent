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

ActiveRecord::Schema.define(version: 2020_02_28_163540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.string "car"
    t.boolean "baby_chair"
    t.boolean "navigator"
    t.boolean "accept"
    t.string "start_date"
    t.string "end_date"
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
    t.integer "days"
    t.integer "price"
    t.integer "total"
    t.string "document_file_name"
    t.string "document_content_type"
    t.integer "document_file_size"
    t.datetime "document_updated_at"
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
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
    t.integer "sort", default: 0
    t.boolean "show_on_main", default: false
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.boolean "accept"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "docs", force: :cascade do |t|
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.index ["booking_id"], name: "index_docs_on_booking_id"
  end

  create_table "faqs", force: :cascade do |t|
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.boolean "main_photo", default: false
    t.index ["car_id"], name: "index_photos_on_car_id"
  end

  create_table "prices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "price_date"
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

  create_table "terms", force: :cascade do |t|
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "texts", force: :cascade do |t|
    t.text "main_up_text", default: "Дорогой друг, добро пожаловать в автопрокат </span><span style=\"font-size:22px;\">Амиго!</span>"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "main_h1_text", default: "empty"
    t.text "main_quick_booking_text", default: "empty"
    t.text "main_substances_text", default: "empty"
    t.text "main_car_list_text", default: "empty"
    t.text "main_services_text", default: "empty"
    t.text "main_mission_text", default: "empty"
    t.text "main_edge_text", default: "empty"
    t.text "footer_text", default: "empty"
    t.text "prices_text", default: "empty"
    t.text "prices_bottom_text", default: "empty"
    t.text "contacts_text", default: "empty"
    t.text "bookings_bottom_text", default: "empty"
    t.text "reviews_text", default: "empty"
    t.text "terms_text", default: "empty"
    t.text "faqs_text", default: "empty"
    t.text "about_text", default: "empty"
    t.text "home_title", default: "empty"
    t.text "home_description", default: "empty"
    t.text "cars_title", default: "empty"
    t.text "cars_description", default: "empty"
    t.text "prices_title", default: "empty"
    t.text "prices_description", default: "empty"
    t.text "contacts_title", default: "empty"
    t.text "contacts_description", default: "empty"
    t.text "bookings_title", default: "empty"
    t.text "bookings_description", default: "empty"
    t.text "reviews_title", default: "empty"
    t.text "reviews_description", default: "empty"
    t.text "terms_title", default: "empty"
    t.text "terms_description", default: "empty"
    t.text "faqs_title", default: "empty"
    t.text "faqs_description", default: "empty"
    t.text "abouts_title", default: "empty"
    t.text "abouts_description", default: "empty"
    t.text "dop_table_worktime", default: "empty"
    t.text "dop_table_endtime", default: "empty"
    t.text "dop_table_city_price_worktime", default: "empty"
    t.text "dop_table_city_price_endtime", default: "empty"
    t.text "dop_table_aero_price_worktime", default: "empty"
    t.text "dop_table_aero_price_endtime", default: "empty"
    t.text "dop_table_svetlogorsk_price_worktime", default: "empty"
    t.text "dop_table_svetlogorsk_price_endtime", default: "empty"
    t.text "dop_table_zelenogradsk_price_worktime", default: "empty"
    t.text "dop_table_zelenogradsk_price_endtime", default: "empty"
    t.text "dop_table_kosa_price_worktime", default: "empty"
    t.text "dop_table_kosa_price_endtime", default: "empty"
    t.text "dop_table_kreslo_dayprice", default: "empty"
    t.text "dop_table_kreslo_allprice", default: "empty"
    t.text "dop_table_navigator_dayprice", default: "empty"
    t.text "dop_table_downtext", default: "empty"
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

  add_foreign_key "docs", "bookings"
end
