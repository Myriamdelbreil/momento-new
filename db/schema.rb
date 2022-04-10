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

ActiveRecord::Schema.define(version: 2022_04_10_223259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accomodation_votes", force: :cascade do |t|
    t.bigint "accomodation_id", null: false
    t.bigint "participant_id", null: false
    t.integer "vote"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accomodation_id"], name: "index_accomodation_votes_on_accomodation_id"
    t.index ["participant_id"], name: "index_accomodation_votes_on_participant_id"
  end

  create_table "accomodations", force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.boolean "confirmed"
    t.string "address"
    t.string "url"
    t.string "title"
    t.text "description"
    t.float "price"
    t.string "img"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trip_id"], name: "index_accomodations_on_trip_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "event_participants", force: :cascade do |t|
    t.bigint "participant_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_participants_on_event_id"
    t.index ["participant_id"], name: "index_event_participants_on_participant_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "participant_id", null: false
    t.bigint "trip_id", null: false
    t.string "description"
    t.string "start_date"
    t.string "end_date"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["participant_id"], name: "index_events_on_participant_id"
    t.index ["trip_id"], name: "index_events_on_trip_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "participant_id", null: false
    t.float "amount"
    t.string "title"
    t.boolean "mutual"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["participant_id"], name: "index_expenses_on_participant_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "participant_id", null: false
    t.bigint "trip_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["participant_id"], name: "index_messages_on_participant_id"
    t.index ["trip_id"], name: "index_messages_on_trip_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trip_id"], name: "index_participants_on_trip_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "transportations", force: :cascade do |t|
    t.bigint "participant_id", null: false
    t.float "price"
    t.string "origin"
    t.string "destination"
    t.string "mean"
    t.string "departure_date"
    t.string "arrival_date"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["participant_id"], name: "index_transportations_on_participant_id"
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "start_date"
    t.string "end_date"
    t.string "title"
    t.text "description"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accomodation_votes", "accomodations"
  add_foreign_key "accomodation_votes", "participants"
  add_foreign_key "accomodations", "trips"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "event_participants", "events"
  add_foreign_key "event_participants", "participants"
  add_foreign_key "events", "participants"
  add_foreign_key "events", "trips"
  add_foreign_key "expenses", "participants"
  add_foreign_key "messages", "participants"
  add_foreign_key "messages", "trips"
  add_foreign_key "participants", "trips"
  add_foreign_key "participants", "users"
  add_foreign_key "transportations", "participants"
  add_foreign_key "trips", "users"
end
