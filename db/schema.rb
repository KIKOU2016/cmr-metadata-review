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

ActiveRecord::Schema.define(version: 20170131170527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.string "concept_id",              null: false
    t.string "short_name", default: ""
  end

  create_table "comments", force: :cascade do |t|
    t.integer "record_id"
    t.integer "user_id"
    t.integer "total_comment_count"
    t.string  "rawJSON"
  end

  add_index "comments", ["record_id"], name: "index_comments_on_record_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "flags", force: :cascade do |t|
    t.integer "record_id"
    t.integer "user_id"
    t.integer "total_flag_count"
    t.string  "rawJSON"
  end

  add_index "flags", ["record_id"], name: "index_flags_on_record_id", using: :btree
  add_index "flags", ["user_id"], name: "index_flags_on_user_id", using: :btree

  create_table "granules", force: :cascade do |t|
    t.string  "concept_id"
    t.integer "collection_id"
  end

  add_index "granules", ["collection_id"], name: "index_granules_on_collection_id", using: :btree

  create_table "ingests", force: :cascade do |t|
    t.integer  "record_id"
    t.integer  "user_id"
    t.datetime "date_ingested"
  end

  add_index "ingests", ["record_id"], name: "index_ingests_on_record_id", using: :btree
  add_index "ingests", ["user_id"], name: "index_ingests_on_user_id", using: :btree

  create_table "record_rows", force: :cascade do |t|
    t.integer "record_id"
    t.integer "user_id"
    t.string  "row_name"
    t.integer "record_info_count"
    t.string  "rawJSON"
  end

  add_index "record_rows", ["record_id"], name: "index_record_rows_on_record_id", using: :btree
  add_index "record_rows", ["user_id"], name: "index_record_rows_on_user_id", using: :btree

  create_table "records", force: :cascade do |t|
    t.integer "recordable_id"
    t.string  "recordable_type"
    t.string  "revision_id"
    t.boolean "closed"
    t.string  "rawJSON"
  end

  add_index "records", ["recordable_type", "recordable_id"], name: "index_records_on_recordable_type_and_recordable_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "record_id"
    t.integer  "user_id"
    t.datetime "review_completion_date"
    t.integer  "review_state"
    t.string   "comment",                default: ""
  end

  add_index "reviews", ["record_id"], name: "index_reviews_on_record_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.boolean  "curator",                default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
