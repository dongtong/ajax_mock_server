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

ActiveRecord::Schema.define(version: 20151223080829) do

  create_table "namespaces", force: true do |t|
    t.string   "url_key"
    t.string   "url_address"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ns"
    t.text     "res"
  end

  create_table "state_codes", force: true do |t|
    t.string   "code_num"
    t.string   "code_des"
    t.integer  "namespace_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "code_res_json"
    t.boolean  "actived",       default: false
  end

end
