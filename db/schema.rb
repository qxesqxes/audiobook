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

ActiveRecord::Schema.define(:version => 20121221133141) do

  create_table "chapters", :force => true do |t|
    t.string   "name"
    t.integer  "story_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "details", :force => true do |t|
    t.string   "type"
    t.integer  "user_id"
    t.integer  "story_id"
    t.text     "description"
    t.string   "name"
    t.string   "photo"
    t.string   "voice"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "chapter_id"
    t.integer  "pid"
  end

  create_table "participations", :force => true do |t|
    t.integer  "story_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "participations", ["story_id", "user_id"], :name => "index_participations_on_story_id_and_user_id", :unique => true
  add_index "participations", ["story_id"], :name => "index_participations_on_story_id"
  add_index "participations", ["user_id"], :name => "index_participations_on_user_id"

  create_table "stories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "started_at"
    t.date     "ended_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "picture"
  end

end
