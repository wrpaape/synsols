# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150625082214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title",                          null: false
    t.text     "description",    default: "N/A"
    t.integer  "enrollment_cap"
    t.integer  "location_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "courses", ["location_id"], name: "index_courses_on_location_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "first_name",  null: false
    t.string   "last_name",   null: false
    t.string   "job_title"
    t.date     "hire_date"
    t.integer  "location_id"
    t.integer  "company_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "employees", ["company_id"], name: "index_employees_on_company_id", using: :btree
  add_index "employees", ["location_id"], name: "index_employees_on_location_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locations", ["company_id"], name: "index_locations_on_company_id", using: :btree

  create_table "participants", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "course_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "participants", ["course_id"], name: "index_participants_on_course_id", using: :btree
  add_index "participants", ["employee_id"], name: "index_participants_on_employee_id", using: :btree

  add_foreign_key "courses", "locations"
  add_foreign_key "employees", "companies"
  add_foreign_key "employees", "locations"
  add_foreign_key "locations", "companies"
  add_foreign_key "participants", "courses"
  add_foreign_key "participants", "employees"
end
