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

ActiveRecord::Schema.define(version: 20160623013124) do

  create_table "blog_contents", force: :cascade do |t|
    t.integer  "blog_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.text     "content",        limit: 65535
    t.boolean  "is_public",                    default: true
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "content_counts", limit: 4,     default: 0,    null: false
  end

  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id", using: :btree

  create_table "blogs_tags", force: :cascade do |t|
    t.integer "blog_id", limit: 4
    t.integer "tag_id",  limit: 4
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "friend_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "friendships", ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", unique: true, using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id",   limit: 4
    t.integer  "receiver_id", limit: 4
    t.text     "content",     limit: 65535
    t.boolean  "is_read",                   default: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_records", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "blog_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_records", ["user_id"], name: "index_user_records_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",         limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "crypted_password", limit: 255, null: false
    t.string   "salt",             limit: 255, null: false
  end

end
