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

ActiveRecord::Schema.define(version: 20170427172625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "code_lists", force: :cascade do |t|
    t.string   "name"
    t.string   "code_system"
    t.integer  "count"
    t.string   "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "icd10_cm_diagnosis_codes_id"
    t.index ["icd10_cm_diagnosis_codes_id"], name: "codes_icd10_d", using: :btree
  end

  create_table "code_lists_icd10_cm_diagnosis_codes", force: :cascade do |t|
    t.integer "code_list_id"
    t.integer "icd10_cm_diagnosis_code_id"
    t.index ["code_list_id"], name: "codes_icd10_diag", using: :btree
    t.index ["icd10_cm_diagnosis_code_id"], name: "codes_icd10_list", using: :btree
  end

  create_table "icd10_cm_diagnosis_codes", force: :cascade do |t|
    t.string   "code"
    t.string   "code_system"
    t.string   "description"
    t.string   "info"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "code_lists_icd10_cm_diagnosis_codes", "code_lists"
  add_foreign_key "code_lists_icd10_cm_diagnosis_codes", "icd10_cm_diagnosis_codes"
end
