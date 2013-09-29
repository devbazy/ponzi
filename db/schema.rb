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

ActiveRecord::Schema.define(:version => 20130929173330) do

  create_table "accounts", :force => true do |t|
    t.float    "amount"
    t.string   "daddr"
    t.string   "waddr"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "associations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "associations", ["game_id"], :name => "index_associations_on_game_id"
  add_index "associations", ["user_id", "game_id"], :name => "index_associations_on_user_id_and_game_id", :unique => true
  add_index "associations", ["user_id"], :name => "index_associations_on_user_id"

  create_table "games", :force => true do |t|
    t.integer  "players_no"
    t.integer  "winners_no"
    t.boolean  "open"
    t.integer  "seed"
    t.integer  "owner_id"
    t.float    "cost"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "old_game_id"
  end

  create_table "old_games", :force => true do |t|
    t.integer  "game_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
