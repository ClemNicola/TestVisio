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

ActiveRecord::Schema[7.1].define(version: 2024_01_14_183427) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advisors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "bio"
    t.text "speciality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_advisors_on_user_id"
  end

  create_table "appointment_types", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "color", default: "#000000"
    t.integer "duration"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_appointment_types_on_user_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "advisor_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "appointment_type_id"
    t.index ["advisor_id"], name: "index_appointments_on_advisor_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "availabilities", force: :cascade do |t|
    t.bigint "advisor_id", null: false
    t.integer "day_of_week"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advisor_id"], name: "index_availabilities_on_advisor_id"
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
    t.string "booking_link"
    t.boolean "cgp"
    t.index ["booking_link"], name: "index_users_on_booking_link", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "advisors", "users"
  add_foreign_key "appointment_types", "users"
  add_foreign_key "appointments", "advisors"
  add_foreign_key "appointments", "users"
  add_foreign_key "availabilities", "advisors"
end
