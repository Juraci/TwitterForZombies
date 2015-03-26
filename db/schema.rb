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

ActiveRecord::Schema.define(:version => 20150308183455) do

  create_table "assignments", :force => true do |t|
    t.integer "zombie_id"
    t.integer "role_id"
  end

  add_index "assignments", ["role_id"], :name => "index_assignments_on_role_id"
  add_index "assignments", ["zombie_id"], :name => "index_assignments_on_zombie_id"

  create_table "brains", :force => true do |t|
    t.integer  "zombie_id"
    t.string   "status"
    t.string   "flavor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "brains", ["zombie_id"], :name => "index_brains_on_zombie_id"

  create_table "roles", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", :force => true do |t|
    t.string   "message"
    t.integer  "zombie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tweets", ["zombie_id"], :name => "index_tweets_on_zombie_id"

  create_table "zombies", :force => true do |t|
    t.string   "name"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.boolean  "rotting",    :default => false
    t.integer  "age"
    t.string   "decomp"
  end

end
