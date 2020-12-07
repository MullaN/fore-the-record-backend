# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_18_232958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "workshop_link"
    t.string "cover_img"
    t.string "description"
    t.integer "hole_1"
    t.integer "hole_2"
    t.integer "hole_3"
    t.integer "hole_4"
    t.integer "hole_5"
    t.integer "hole_6"
    t.integer "hole_7"
    t.integer "hole_8"
    t.integer "hole_9"
    t.integer "hole_10"
    t.integer "hole_11"
    t.integer "hole_12"
    t.integer "hole_13"
    t.integer "hole_14"
    t.integer "hole_15"
    t.integer "hole_16"
    t.integer "hole_17"
    t.integer "hole_18"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "matches", force: :cascade do |t|
    t.string "screenshot_url"
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_matches_on_course_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.bigint "match_id", null: false
    t.integer "hole_1"
    t.integer "hole_2"
    t.integer "hole_3"
    t.integer "hole_4"
    t.integer "hole_5"
    t.integer "hole_6"
    t.integer "hole_7"
    t.integer "hole_8"
    t.integer "hole_9"
    t.integer "hole_10"
    t.integer "hole_11"
    t.integer "hole_12"
    t.integer "hole_13"
    t.integer "hole_14"
    t.integer "hole_15"
    t.integer "hole_16"
    t.integer "hole_17"
    t.integer "hole_18"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_rounds_on_course_id"
    t.index ["match_id"], name: "index_rounds_on_match_id"
    t.index ["user_id"], name: "index_rounds_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.bigint "steam_id"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "matches", "courses"
  add_foreign_key "rounds", "courses"
  add_foreign_key "rounds", "matches"
  add_foreign_key "rounds", "users"
end
