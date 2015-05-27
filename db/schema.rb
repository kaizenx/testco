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

ActiveRecord::Schema.define(version: 20150508104933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assigned_roles", force: :cascade do |t|
    t.integer  "role_id",    null: false
    t.integer  "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "available_areas", force: :cascade do |t|
    t.integer  "area_id",     null: false
    t.integer  "location_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "available_pricings", force: :cascade do |t|
    t.integer  "location_id", null: false
    t.integer  "pricing_id",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "available_services", force: :cascade do |t|
    t.integer  "service_id",  null: false
    t.integer  "location_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "communities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.string   "image",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
  end

  create_table "enquiries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "company",    limit: 255
    t.string   "phone",      limit: 255
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "types",      limit: 255
    t.string   "location",   limit: 255
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",             limit: 255, null: false
    t.datetime "date",                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id",                   null: false
    t.string   "image",             limit: 255
    t.text     "description"
    t.string   "short_description", limit: 255
  end

  create_table "location_mentorships", force: :cascade do |t|
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "profile_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",                limit: 255,                           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image",               limit: 255
    t.text     "address"
    t.text     "description"
    t.string   "service_title",       limit: 255, default: "Our services"
    t.text     "service_description"
    t.string   "mentor_title",        limit: 255, default: "Mentorship"
    t.text     "mentor_description"
    t.string   "company_title",       limit: 255, default: "Our companies"
    t.text     "company_description"
    t.string   "map_title",           limit: 255, default: "Finding us"
    t.text     "map_description"
    t.text     "map_embed"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "google_map_link",     limit: 255
    t.integer  "city_id"
    t.string   "phone"
  end

  create_table "news", force: :cascade do |t|
    t.string   "title",      limit: 255, null: false
    t.text     "content",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pricings", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency",   limit: 255
    t.string   "period",     limit: 255
    t.boolean  "public"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "blurb"
    t.string   "title"
    t.string   "facebook"
    t.string   "instagram"
    t.string   "twitter"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "image",       limit: 255
    t.string   "title",       limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",     null: false
    t.string   "encrypted_password",     limit: 255, default: "",     null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "name",                   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   limit: 255, default: "user", null: false
    t.integer  "location_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
