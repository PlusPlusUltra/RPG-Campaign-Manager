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

ActiveRecord::Schema.define(version: 2019_06_21_172352) do

  create_table "campaigns", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "user_id"
    t.text "master"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "lvl"
    t.string "class_type"
    t.string "race"
    t.string "info"
    t.integer "user_id"
    t.integer "campaign_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "start_day"
    t.integer "start_month"
    t.integer "start_year"
    t.integer "start_hour"
    t.integer "start_minute"
    t.integer "end_day"
    t.integer "end_month"
    t.integer "end_year"
    t.integer "end_hour"
    t.integer "end_minute"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invites", force: :cascade do |t|
    t.string "dest"
    t.string "campaign"
    t.string "sender"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "senderid"
    t.integer "campaignid"
    t.integer "destid"
    t.index ["user_id"], name: "index_invites_on_user_id"
  end

  create_table "planners", force: :cascade do |t|
    t.string "sender"
    t.string "dest"
    t.integer "senderid"
    t.integer "destid"
    t.string "answer"
    t.integer "day"
    t.integer "month"
    t.integer "year"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_planners_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "dest"
    t.string "campaign"
    t.string "sender"
    t.integer "senderid"
    t.integer "campaignid"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "destid"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.string "username"
    t.boolean "admin", default: false
    t.string "provider"
    t.string "uid"
    t.boolean "block", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
