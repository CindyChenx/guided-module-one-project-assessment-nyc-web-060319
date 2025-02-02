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

ActiveRecord::Schema.define(version: 2019_06_20_182231) do

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "country_code"
  end

  create_table "country_holidays", force: :cascade do |t|
    t.integer "country_id"
    t.integer "holiday_id"
  end

  create_table "holiday_trips", force: :cascade do |t|
    t.integer "holiday_id"
    t.integer "trip_id"
    t.string "country_id"
  end

  create_table "holidays", force: :cascade do |t|
    t.string "date"
    t.string "description"
    t.string "name"
    t.string "type_of_holiday"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.string "start_date"
    t.string "end_date"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
