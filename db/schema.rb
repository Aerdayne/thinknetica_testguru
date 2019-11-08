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

ActiveRecord::Schema.define(version: 2019_11_05_120519) do

  create_table "answers", force: :cascade do |t|
    t.text "content", default: "no content", null: false
    t.boolean "correct", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "question_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "badges", force: :cascade do |t|
    t.text "name", null: false
    t.text "description", default: "No description"
    t.text "image_path", null: false
    t.text "criterion", default: "unspecified"
    t.text "value", default: "unspecified"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["criterion", "value"], name: "index_badges_on_criterion_and_value", unique: true
    t.index ["name"], name: "index_badges_on_name"
  end

  create_table "categories", force: :cascade do |t|
    t.text "content", default: "no content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "title", default: "no title", null: false
  end

  create_table "gists", force: :cascade do |t|
    t.text "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "question_id"
    t.index ["question_id"], name: "index_gists_on_question_id"
    t.index ["user_id"], name: "index_gists_on_user_id"
  end

  create_table "given_badges", force: :cascade do |t|
    t.integer "badge_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["badge_id"], name: "index_given_badges_on_badge_id"
    t.index ["user_id"], name: "index_given_badges_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "content", default: "no content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "test_id"
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "taken_tests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "test_id"
    t.boolean "successful", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "current_question_id"
    t.integer "correct_questions", default: 0
    t.index ["current_question_id"], name: "index_taken_tests_on_current_question_id"
    t.index ["test_id"], name: "index_taken_tests_on_test_id"
    t.index ["user_id"], name: "index_taken_tests_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.text "title", default: "no title", null: false
    t.text "content", default: "no content", null: false
    t.integer "level", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "author_id"
    t.integer "category_id"
    t.index ["author_id"], name: "index_tests_on_author_id"
    t.index ["category_id"], name: "index_tests_on_category_id"
    t.index ["title", "level"], name: "index_tests_on_title_and_level", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.text "name", null: false
    t.text "surname"
    t.text "email", default: "", null: false
    t.text "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "type", default: "User", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["type"], name: "index_users_on_type"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "gists", "questions"
  add_foreign_key "gists", "users"
  add_foreign_key "given_badges", "badges"
  add_foreign_key "given_badges", "users"
  add_foreign_key "questions", "tests"
  add_foreign_key "taken_tests", "questions", column: "current_question_id"
  add_foreign_key "taken_tests", "tests"
  add_foreign_key "taken_tests", "users"
  add_foreign_key "tests", "categories"
  add_foreign_key "tests", "users", column: "author_id"
end
