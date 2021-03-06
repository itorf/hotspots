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

ActiveRecord::Schema.define(version: 20141003163909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: true do |t|
    t.string   "name",        null: false
    t.string   "street",      null: false
    t.string   "city",        null: false
    t.string   "state",       null: false
    t.string   "zipcode",     null: false
    t.text     "description"
    t.integer  "price_range"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "businesses", ["city"], name: "index_businesses_on_city", using: :btree
  add_index "businesses", ["name"], name: "index_businesses_on_name", using: :btree
  add_index "businesses", ["zipcode"], name: "index_businesses_on_zipcode", using: :btree

  create_table "images", force: true do |t|
    t.string   "url",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "business_id"
  end

  add_index "images", ["business_id"], name: "index_images_on_business_id", using: :btree
  add_index "images", ["url"], name: "index_images_on_url", using: :btree

  create_table "reviews", force: true do |t|
    t.text     "body",        null: false
    t.integer  "score",       null: false
    t.integer  "business_id", null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["business_id"], name: "index_reviews_on_business_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "business_id", null: false
    t.integer  "tag_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["business_id"], name: "index_taggings_on_business_id", using: :btree
  add_index "taggings", ["tag_id", "business_id"], name: "index_taggings_on_tag_id_and_business_id", unique: true, using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end
