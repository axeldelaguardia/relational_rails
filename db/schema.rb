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

ActiveRecord::Schema.define(version: 2023_01_31_220947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dog_groomers", force: :cascade do |t|
    t.string "name"
    t.boolean "master_groomer"
    t.string "salon"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.bigint "dog_groomer_id"
    t.string "name"
    t.integer "age"
    t.integer "weight"
    t.boolean "trained"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dog_groomer_id"], name: "index_pets_on_dog_groomer_id"
  end

  add_foreign_key "pets", "dog_groomers"
end
