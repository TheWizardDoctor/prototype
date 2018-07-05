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

ActiveRecord::Schema.define(version: 2018_07_03_162315) do

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "initiative_id"
    t.string "quater", default: "Q1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "team_type"
    t.integer "primary_team_id"
    t.string "owner"
    t.boolean "scope", default: false
    t.index ["initiative_id"], name: "index_features_on_initiative_id"
  end

  create_table "initiatives", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "roadmap_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "investment", default: 0
    t.integer "percentage"
    t.integer "estimated_teams"
    t.integer "teams"
    t.string "key_strategey"
    t.string "product_manager"
    t.index ["roadmap_id"], name: "index_initiatives_on_roadmap_id"
  end

  create_table "investments", force: :cascade do |t|
    t.integer "feature_id"
    t.integer "team_id"
    t.integer "investment", default: 0
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
