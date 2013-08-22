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

ActiveRecord::Schema.define(version: 20130821235631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "age_groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_no"
  end

  create_table "courses", force: true do |t|
    t.integer  "timetable_id"
    t.integer  "instructor_id"
    t.integer  "dance_style_id"
    t.integer  "level_id"
    t.integer  "age_group_id"
    t.date     "open_date"
    t.date     "close_date"
    t.text     "note"
    t.integer  "monthly_fee"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dance_styles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_no"
  end

  create_table "instructors", force: true do |t|
    t.string   "name"
    t.string   "kana"
    t.string   "team"
    t.string   "phone"
    t.string   "email_pc"
    t.string   "email_mobile"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_no"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "zip"
    t.string   "address"
    t.string   "phone"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "open_date"
    t.date     "close_date"
  end

  create_table "studios", force: true do |t|
    t.string   "name"
    t.string   "note"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "open_date"
    t.date     "close_date"
  end

  create_table "time_slots", force: true do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timetables", force: true do |t|
    t.integer  "studio_id"
    t.integer  "cwday"
    t.integer  "time_slot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
