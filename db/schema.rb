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

ActiveRecord::Schema.define(version: 20170314202843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body"
    t.string   "resource_id",   limit: 255, null: false
    t.string   "resource_type", limit: 255, null: false
    t.integer  "author_id"
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "asset_images", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "asset_id"
    t.string   "image_file_file_name"
    t.string   "image_file_content_type"
    t.integer  "image_file_file_size"
    t.datetime "image_file_updated_at"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "asset_media", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "asset_id"
    t.string   "media_file_file_name"
    t.string   "media_file_content_type"
    t.integer  "media_file_file_size"
    t.datetime "media_file_updated_at"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "media_duration"
    t.integer  "position"
  end

  create_table "asset_types", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.integer  "type_id"
    t.integer  "country_id"
    t.integer  "city_id"
    t.integer  "paid_condition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "asset_type_id"
    t.string   "audio_file_file_name",    limit: 255
    t.string   "audio_file_content_type", limit: 255
    t.integer  "audio_file_file_size"
    t.datetime "audio_file_updated_at"
    t.string   "text_file_file_name",     limit: 255
    t.string   "text_file_content_type",  limit: 255
    t.integer  "text_file_file_size"
    t.datetime "text_file_updated_at"
    t.string   "text_file_url",           limit: 255
    t.string   "audio_file_url",          limit: 255
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address",                 limit: 255
    t.string   "thumbnail_file_name",     limit: 255
    t.string   "thumbnail_content_type",  limit: 255
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.string   "text"
    t.string   "audio_duration"
  end

  create_table "cities", force: :cascade do |t|
    t.string  "name",       limit: 255
    t.string  "code",       limit: 255
    t.string  "iso_name",   limit: 255
    t.boolean "enabled"
    t.integer "country_id"
    t.float   "price"
  end

  create_table "countries", force: :cascade do |t|
    t.string  "name",     limit: 255
    t.string  "code",     limit: 255
    t.string  "iso_name", limit: 255
    t.boolean "enabled"
  end

  create_table "paid_conditions", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_token",              limit: 255
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "image_url",              limit: 255
    t.boolean  "is_female",                          default: false
    t.string   "facebook_link",          limit: 255
    t.string   "authentication_token",   limit: 255
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
