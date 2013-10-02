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

ActiveRecord::Schema.define(version: 20130908195848) do

  create_table "ebooks", force: true do |t|
    t.string   "name"
    t.string   "author"
    t.string   "abstract"
    t.float    "loanamount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "libraryebooks", force: true do |t|
    t.string   "name"
    t.string   "author"
    t.string   "genre"
    t.string   "abstract"
    t.float    "loanamount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationshps", force: true do |t|
    t.integer  "libraryebook_id"
    t.integer  "user_id"
    t.string   "status"
    t.date     "loanstart"
    t.date     "loanend"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationshps", ["user_id"], name: "index_relationshps_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "zipcode"
    t.string   "useremail"
    t.string   "password"
    t.string   "aboutme"
    t.string   "interests"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmpassword"
    t.string   "password_digest"
    t.string   "remember_token"
  end

end
