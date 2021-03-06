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

ActiveRecord::Schema.define(version: 2019_03_21_135518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "month"
    t.float "revenue"
    t.float "occupancy_ratio"
    t.float "average_night_rate"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "year"
    t.string "quarter"
    t.index ["listing_id"], name: "index_bookings_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "public_listing_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "display_name"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "listing_id"
    t.string "title"
    t.string "content"
    t.string "doc_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment"
    t.index ["listing_id"], name: "index_messages_on_listing_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "content"
    t.text "story"
    t.index ["listing_id"], name: "index_photos_on_listing_id"
  end

  create_table "user_listings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_user_listings_on_listing_id"
    t.index ["user_id"], name: "index_user_listings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "photo"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "listings"
  add_foreign_key "messages", "listings"
  add_foreign_key "photos", "listings"
  add_foreign_key "user_listings", "listings"
  add_foreign_key "user_listings", "users"
end
