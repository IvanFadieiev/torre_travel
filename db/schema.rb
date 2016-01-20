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

ActiveRecord::Schema.define(version: 20160112142528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "name"
    t.string   "body"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commercials", force: :cascade do |t|
    t.string   "body"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.text     "description"
    t.integer  "torre_travel_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "image_of_housing_file_name"
    t.string   "image_of_housing_content_type"
    t.integer  "image_of_housing_file_size"
    t.datetime "image_of_housing_updated_at"
  end

  add_index "images", ["torre_travel_id"], name: "index_images_on_torre_travel_id", using: :btree

  create_table "slyders", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
  end

  create_table "torre_travels", force: :cascade do |t|
    t.integer  "housing"
    t.decimal  "price"
    t.integer  "distance"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "description_es"
    t.integer  "distance_m"
    t.text     "address"
    t.integer  "reserved"
  end

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "images", "torre_travels"
end
