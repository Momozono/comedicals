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

ActiveRecord::Schema.define(version: 20150715004324) do

  create_table "microposts", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"

  create_table "professions", force: :cascade do |t|
    t.string   "profession_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_professions", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.integer  "profession_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_professions", ["profession_id"], name: "index_user_professions_on_profession_id"
  add_index "user_professions", ["user_id", "profession_id"], name: "index_user_professions_on_user_id_and_profession_id", unique: true
  add_index "user_professions", ["user_id"], name: "index_user_professions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest", limit: 255
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
