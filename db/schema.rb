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

ActiveRecord::Schema.define(version: 2019_02_07_133906) do

  create_table "pia_questionnaires", force: :cascade do |t|
    t.string "name"
    t.string "participants"
    t.string "auditor"
    t.integer "progress", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pia_questions", force: :cascade do |t|
    t.text "question"
    t.text "description"
    t.text "yes_explanation"
    t.text "no_explanation"
    t.text "yes_measure"
    t.text "no_measure"
    t.integer "position", default: 0
    t.boolean "yes_to_end", default: false
    t.boolean "no_to_end", default: false
    t.integer "yes_next_question_id"
    t.integer "no_next_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["no_next_question_id"], name: "index_pia_questions_on_no_next_question_id"
    t.index ["yes_next_question_id"], name: "index_pia_questions_on_yes_next_question_id"
  end

end
