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

ActiveRecord::Schema.define(version: 20150704114602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "clubs", force: true do |t|
    t.string   "username"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "can_vote"
  end

  add_index "clubs", ["email"], name: "index_clubs_on_email", unique: true, using: :btree
  add_index "clubs", ["reset_password_token"], name: "index_clubs_on_reset_password_token", unique: true, using: :btree

  create_table "planets", force: true do |t|
    t.text     "name"
    t.float    "mass_jup"
    t.float    "mass_earth"
    t.float    "semi_major"
    t.float    "period"
    t.integer  "top_vote"
    t.string   "top_vote_name"
    t.float    "total_votes"
    t.integer  "system_id"
    t.integer  "discovery_year"
    t.string   "image_url"
    t.string   "state",          default: "pending"
    t.boolean  "nameable",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposal_votes", force: true do |t|
    t.integer "proposal_id", null: false
    t.integer "user_id",     null: false
    t.integer "system_id",   null: false
  end

  add_index "proposal_votes", ["proposal_id", "user_id"], name: "index_proposal_votes_on_proposal_id_and_user_id", unique: true, using: :btree
  add_index "proposal_votes", ["system_id", "user_id"], name: "index_proposal_votes_on_system_id_and_user_id", unique: true, using: :btree

  create_table "proposals", force: true do |t|
    t.integer  "club_id"
    t.integer  "system_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposed_names", force: true do |t|
    t.string   "name"
    t.integer  "planet_id"
    t.integer  "vote_count"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "nameable_entity_id"
    t.string   "nameable_entity_type"
    t.text     "description"
    t.integer  "proposal_id"
  end

  create_table "proposing_organisations", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "remarks", force: true do |t|
    t.integer  "club_id"
    t.integer  "system_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "system_votes", force: true do |t|
    t.integer "club_id"
    t.integer "system_id"
  end

  create_table "systems", force: true do |t|
    t.string   "name"
    t.float    "mass"
    t.float    "vmag"
    t.string   "visibility"
    t.string   "constellation"
    t.boolean  "nameable",      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "location"
    t.string   "country"
    t.string   "uid"
    t.string   "provider"
    t.string   "name"
    t.string   "email"
    t.string   "avatar"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.integer  "vote_count",       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.hstore   "extra_info"
  end

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "proposed_name_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
