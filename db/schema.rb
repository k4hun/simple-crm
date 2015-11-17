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

ActiveRecord::Schema.define(version: 20151117075108) do

  create_table "accounts", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "zip_code"
    t.string   "city"
    t.string   "voivodeship"
    t.boolean  "visible",     default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "client_id"
    t.integer  "company_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.integer  "nip",        limit: 10
    t.text     "comment"
    t.boolean  "visible",               default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "email"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "client_id"
    t.boolean  "visible",     default: false
    t.datetime "end_date"
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "infos", force: :cascade do |t|
    t.string   "info_type"
    t.string   "value"
    t.integer  "client_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.string   "role"
    t.integer  "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "skype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
