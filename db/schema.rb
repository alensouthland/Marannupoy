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

ActiveRecord::Schema.define(version: 20160328130738) do

  create_table "founds", force: :cascade do |t|
    t.string   "found_item_name", limit: 25
    t.text     "found_item_desc", limit: 255
    t.integer  "found_phone_no",  limit: 8,                  null: false
    t.date     "found_date"
    t.string   "found_place",     limit: 15
    t.boolean  "f_lost_flag",                 default: true
    t.string   "found_auth_key",  limit: 255
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "losts", force: :cascade do |t|
    t.string   "lost_item_name", limit: 25
    t.text     "lost_item_desc", limit: 255
    t.integer  "lost_phone_no",  limit: 8,                  null: false
    t.date     "lost_date"
    t.string   "lost_place",     limit: 15
    t.boolean  "l_lost_flag",                default: true
    t.string   "lost_auth_key",  limit: 255
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

end
