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

ActiveRecord::Schema.define(version: 2022_11_30_105302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bot_methods", force: :cascade do |t|
    t.text "body"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["category_id"], name: "index_bot_methods_on_category_id"
    t.index ["user_id"], name: "index_bot_methods_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "polls", force: :cascade do |t|
    t.string "title"
    t.string "question1"
    t.string "question2"
    t.string "question3"
    t.string "question4"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.integer "result1", default: 0
    t.integer "result2", default: 0
    t.integer "result3", default: 0
    t.integer "result4", default: 0
    t.string "channel"
    t.string "message"
    t.index ["user_id"], name: "index_polls_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "discord_token"
  end

  add_foreign_key "bot_methods", "categories"
  add_foreign_key "bot_methods", "users"
  add_foreign_key "polls", "users"
end
