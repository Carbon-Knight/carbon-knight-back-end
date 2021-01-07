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

ActiveRecord::Schema.define(version: 2021_01_07_025459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_monthly_mileages", force: :cascade do |t|
    t.bigint "car_id"
    t.bigint "footprint_id"
    t.integer "total_mileage"
    t.string "month"
    t.string "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_car_monthly_mileages_on_car_id"
    t.index ["footprint_id"], name: "index_car_monthly_mileages_on_footprint_id"
  end

  create_table "cars", force: :cascade do |t|
    t.integer "user_id"
    t.string "make"
    t.string "model"
    t.integer "year"
    t.integer "mpg"
    t.string "fuel_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "footprints", force: :cascade do |t|
    t.float "carbon_in_kg"
    t.float "offset_cost_total"
    t.string "offset_cost_currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "car_monthly_mileages", "cars"
  add_foreign_key "car_monthly_mileages", "footprints"
end
