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

ActiveRecord::Schema.define(version: 20130908181423) do

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

  add_index "users", ["useremail"], name: "index_users_on_useremail", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
