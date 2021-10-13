# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_13_161021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.bigint "recording_id", null: false
    t.bigint "creator_id"
    t.string "recordable_type", null: false
    t.bigint "recordable_id", null: false
    t.string "recordable_previous_type"
    t.bigint "recordable_previous_id"
    t.string "action", null: false
    t.jsonb "detail", default: "{}", null: false
    t.datetime "created_at", precision: 6
    t.index ["action"], name: "index_events_on_action"
    t.index ["creator_id"], name: "index_events_on_creator_id"
    t.index ["recordable_previous_type", "recordable_previous_id"], name: "recordable_previous_index"
    t.index ["recordable_type", "recordable_id"], name: "index_events_on_recordable"
    t.index ["recording_id"], name: "index_events_on_recording_id"
  end

  create_table "recordings", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "parent_id"
    t.bigint "recordable_id"
    t.string "recordable_type"
    t.string "status", default: "active", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.string "guid"
    t.string "user_agent"
    t.string "ip_address"
    t.datetime "created_at", precision: 6
    t.index ["event_id"], name: "index_requests_on_event_id"
  end

  create_table "todolists", force: :cascade do |t|
    t.string "name"
    t.text "description"
  end

  create_table "todos", force: :cascade do |t|
    t.text "content", null: false
    t.integer "position", default: 0
    t.boolean "complete", default: false
    t.datetime "starts_on", precision: 6
    t.datetime "due_on", precision: 6
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "recordings"
  add_foreign_key "events", "users", column: "creator_id"
  add_foreign_key "requests", "events"
end
