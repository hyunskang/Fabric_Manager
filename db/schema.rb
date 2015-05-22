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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150520033812) do

  create_table "fabrics", :force => true do |t|
    t.string   "color"
    t.string   "serial"
    t.integer  "quantity"
    t.decimal  "price"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.decimal  "meters_sold",  :default => 0.0, :null => false
    t.integer  "rolls_sold",   :default => 0,   :null => false
    t.decimal  "total_profit", :default => 0.0, :null => false
  end

  create_table "records", :force => true do |t|
    t.integer  "fabric_id"
    t.datetime "transaction_date"
    t.integer  "month"
    t.integer  "day"
    t.integer  "year"
    t.text     "content",          :default => "", :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
