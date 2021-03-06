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

ActiveRecord::Schema.define(version: 20171224120006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "character_fights", force: :cascade do |t|
    t.bigint "character_id"
    t.bigint "fight_id"
    t.integer "delta_experience"
    t.integer "result", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "weapon_id"
    t.index ["character_id"], name: "index_character_fights_on_character_id"
    t.index ["fight_id"], name: "index_character_fights_on_fight_id"
    t.index ["weapon_id"], name: "index_character_fights_on_weapon_id"
  end

  create_table "characters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.integer "lifepoints", null: false
    t.integer "attack", null: false
    t.integer "experience", null: false
    t.string "picture", null: false
  end

  create_table "fights", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "force"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "character_fights", "characters"
  add_foreign_key "character_fights", "fights"
end
