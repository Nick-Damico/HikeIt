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

ActiveRecord::Schema.define(version: 20171113162635) do

  create_table "features", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hikes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "hike_date"
    t.datetime "hike_time"
    t.text "notes"
    t.integer "hiking_trail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "leader_id"
    t.index ["hiking_trail_id"], name: "index_hikes_on_hiking_trail_id"
  end

  create_table "hikes_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "hike_id", null: false
    t.integer "user_id_id"
    t.integer "hike_id_id"
    t.index ["hike_id_id"], name: "index_hikes_users_on_hike_id_id"
    t.index ["user_id_id"], name: "index_hikes_users_on_user_id_id"
  end

  create_table "hiking_trails", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "area"
    t.float "distance"
    t.float "elevation_gain"
    t.integer "difficulty_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "feature_id"
    t.string "image_url"
    t.string "url"
    t.index ["feature_id"], name: "index_hiking_trails_on_feature_id"
  end

  create_table "planned_hikes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "hike_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hike_id", "user_id"], name: "index_planned_hikes_on_hike_id_and_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "trail_name"
    t.text "bio"
    t.string "profile_image"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid"
  end

end
