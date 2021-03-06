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

ActiveRecord::Schema.define(version: 20161010120730) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "content"
    t.boolean  "status"
    t.string   "alias_url"
    t.string   "img_url"
    t.integer  "sequence_number"
    t.string   "article_type"
    t.integer  "product_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "banner_text"
    t.string   "banner_url"
    t.string   "page_title"
    t.string   "meta_title"
    t.string   "meta_keywords"
    t.string   "meta_description"
  end

  create_table "assets", force: :cascade do |t|
    t.string   "title"
    t.string   "alias_name"
    t.boolean  "status",          default: true
    t.string   "access"
    t.integer  "access_code"
    t.string   "location"
    t.integer  "sequence_number"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "form_data", force: :cascade do |t|
    t.text     "field"
    t.string   "value_of"
    t.string   "seperator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "img_url"
    t.boolean  "status"
    t.string   "alias_url"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sensors", force: :cascade do |t|
    t.string   "sensor_1"
    t.string   "sensor_2"
    t.string   "sensor_3"
    t.string   "sensor_4"
    t.string   "total"
    t.string   "avg"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name"
    t.string   "email_id"
    t.string   "password"
    t.integer  "phone"
    t.boolean  "status"
    t.datetime "last_login"
    t.string   "password_secret"
    t.string   "unicode_data"
    t.string   "role"
    t.string   "reset_code"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
