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

ActiveRecord::Schema.define(version: 20160130210511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.integer  "first_team_id"
    t.integer  "second_team_id"
    t.integer  "first_team_score"
    t.integer  "second_team_score"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "weekly_standing_id"
  end

  add_index "matches", ["first_team_id"], name: "index_matches_on_first_team_id", using: :btree
  add_index "matches", ["second_team_id"], name: "index_matches_on_second_team_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "position"
    t.integer  "number_shirt"
    t.string   "email"
    t.string   "avatar"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "players", ["confirmation_token"], name: "index_players_on_confirmation_token", unique: true, using: :btree
  add_index "players", ["email"], name: "index_players_on_email", unique: true, using: :btree
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true, using: :btree

  create_table "players_teams", id: false, force: :cascade do |t|
    t.integer "team_id",   null: false
    t.integer "player_id", null: false
  end

  create_table "standings", force: :cascade do |t|
    t.integer  "points",             default: 0
    t.integer  "wins",               default: 0
    t.integer  "loss",               default: 0
    t.integer  "drawn",              default: 0
    t.integer  "average",            default: 0
    t.integer  "matchs",             default: 0
    t.integer  "position",           default: 0
    t.integer  "last_position",      default: 0
    t.integer  "player_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "weekly_standing_id"
  end

  add_index "standings", ["player_id"], name: "index_standings_on_player_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "color"
    t.string   "name"
    t.integer  "players_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weekly_standings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "round"
    t.integer  "season"
  end

  add_foreign_key "matches", "teams", column: "first_team_id"
  add_foreign_key "matches", "teams", column: "second_team_id"
end
