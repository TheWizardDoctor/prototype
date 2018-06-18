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

ActiveRecord::Schema.define(version: 2018_06_15_201448) do

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "initiative_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["initiative_id"], name: "index_features_on_initiative_id"
  end

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "initiatives", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "roadmap_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roadmap_id"], name: "index_initiatives_on_roadmap_id"
  end

  create_table "quaters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roadmaps", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_teams_on_feature_id"
  end

end