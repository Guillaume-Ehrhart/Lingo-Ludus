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

ActiveRecord::Schema[7.1].define(version: 2024_07_04_162806) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "difficulty_level"
    t.bigint "user_id", null: false
    t.integer "score", default: 0
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "attempts", default: 0
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "word_id"
    t.bigint "language_id"
    t.index ["category_id"], name: "index_games_on_category_id"
    t.index ["language_id"], name: "index_games_on_language_id"
    t.index ["user_id"], name: "index_games_on_user_id"
    t.index ["word_id"], name: "index_games_on_word_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "words", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id", null: false
    t.text "definition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "level"
    t.bigint "language_id"
    t.index ["category_id"], name: "index_words_on_category_id"
    t.index ["language_id"], name: "index_words_on_language_id"
  end

  add_foreign_key "games", "categories"
  add_foreign_key "games", "languages"
  add_foreign_key "games", "users"
  add_foreign_key "games", "words"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "words", "categories"
  add_foreign_key "words", "languages"
end
