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

ActiveRecord::Schema.define(version: 20140611210956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "planets", force: true do |t|
    t.text     "description"
    t.float    "mass"
    t.float    "radius"
    t.float    "semi_major"
    t.float    "period"
    t.float    "designation"
    t.integer  "top_vote"
    t.string   "top_vote_name"
    t.float    "total_votes"
    t.integer  "system_id"
    t.string   "discovery_method"
    t.datetime "discovery_date"
    t.datetime "discovery_survey"
    t.string   "image_url"
    t.string   "state",            default: "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposed_names", force: true do |t|
    t.string   "name"
    t.integer  "planet_id"
    t.integer  "vote_count"
    t.integer  "proposing_organisation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposing_organisations", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "systems", force: true do |t|
    t.float    "ra"
    t.float    "dec"
    t.string   "star_name"
    t.float    "mass"
    t.float    "luminosity"
    t.float    "radius"
    t.string   "star_type"
    t.integer  "no_planets"
    t.float    "distance"
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
