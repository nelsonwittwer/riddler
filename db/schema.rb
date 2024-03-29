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

ActiveRecord::Schema.define(version: 20130814131156) do

  create_table "cards", force: true do |t|
    t.integer  "facebook_uid"
    t.string   "facebook_name"
    t.string   "profile_picture_url"
    t.boolean  "ruled_out_by_host_player"
    t.boolean  "ruled_out_by_opponent_player"
    t.boolean  "answer_of_host_player"
    t.boolean  "answer_of_opponent_player"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["game_id"], name: "index_cards_on_game_id", using: :btree

  create_table "games", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "host_player_id"
    t.integer  "opponent_player_id"
    t.boolean  "winner_id"
  end

  add_index "games", ["host_player_id"], name: "index_games_on_host_player_id", using: :btree
  add_index "games", ["opponent_player_id"], name: "index_games_on_opponent_player_id", using: :btree

  create_table "questions", force: true do |t|
    t.integer  "user_id"
    t.string   "value"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["game_id"], name: "index_questions_on_game_id", using: :btree
  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",               default: false
    t.string   "provider"
    t.string   "uid"
    t.string   "profile_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.integer  "timezone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
