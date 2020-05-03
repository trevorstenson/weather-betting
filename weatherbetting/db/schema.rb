# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_01_043601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "temperature_bets", force: :cascade do |t|
    t.string "location"
    t.date "date"
    t.integer "high"
    t.integer "low"
    t.integer "over_high_points"
    t.integer "under_high_points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "over_low_points"
    t.integer "under_low_points"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "points"
  end

  create_table "wagers", force: :cascade do |t|
    t.integer "amount"
    t.datetime "time_placed"
    t.integer "bet_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "temperature_bet_id"
    t.index ["user_id"], name: "index_wagers_on_user_id"
  end

  add_foreign_key "wagers", "users"
end
