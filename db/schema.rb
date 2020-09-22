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

ActiveRecord::Schema.define(version: 2020_09_19_212853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fallpro_emails", force: :cascade do |t|
    t.string "email"
    t.bigint "fallpro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fallpro_id"], name: "index_fallpro_emails_on_fallpro_id"
  end

  create_table "fallpro_hazards", force: :cascade do |t|
    t.bigint "fallpro_id"
    t.float "height"
    t.string "units"
    t.string "surface"
    t.boolean "can_drop"
    t.string "drop_strike"
    t.boolean "power_lines"
    t.boolean "holes"
    t.string "hole_control"
    t.boolean "control_zone"
    t.string "cz_measures"
    t.boolean "signage"
    t.string "sig_measures"
    t.string "fall_protection"
    t.boolean "training"
    t.boolean "signup"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fallpro_id"], name: "index_fallpro_hazards_on_fallpro_id"
  end

  create_table "fallpro_reverse_steps", force: :cascade do |t|
    t.integer "order"
    t.string "body"
    t.bigint "fallpro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fallpro_id"], name: "index_fallpro_reverse_steps_on_fallpro_id"
  end

  create_table "fallpro_sites", force: :cascade do |t|
    t.string "project"
    t.string "address"
    t.string "prime"
    t.string "cso_name"
    t.string "cso_phone"
    t.boolean "construction_site"
    t.string "desc"
    t.string "height"
    t.string "units"
    t.boolean "roof"
    t.string "slope"
    t.string "worktype"
    t.string "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fallpro"
    t.string "work_desc"
  end

  create_table "fallpro_steps", force: :cascade do |t|
    t.integer "order"
    t.string "body"
    t.bigint "fallpro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fallpro_id"], name: "index_fallpro_steps_on_fallpro_id"
  end

  create_table "fallpros", force: :cascade do |t|
    t.string "supervisor"
    t.string "company"
    t.boolean "add_procedures"
    t.boolean "picture"
    t.string "sketch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "gaurdrails"
    t.boolean "fall_restraint"
    t.boolean "fall_arrest"
    t.boolean "control_zone"
    t.boolean "control_drop_zone"
    t.string "anchor_structure"
    t.string "anchor_connection"
    t.boolean "full_body_harness"
    t.string "connect_anchor"
    t.string "lifeline"
    t.boolean "rope_grab"
    t.string "lanyard"
    t.string "lanyard_type"
    t.boolean "tool_lanyard"
    t.boolean "matarial_tie"
    t.boolean "control_zone_item"
    t.boolean "all_read"
    t.boolean "safe_area"
    t.boolean "parts_compatible"
    t.boolean "steps_reverse"
    t.boolean "strong_enough"
    t.boolean "equipment_inspected"
    t.boolean "after_breaks"
    t.boolean "rescue"
    t.text "how_rescue"
    t.string "contact_name"
    t.string "contact_number"
    t.string "contact_position"
    t.string "airhorn_location"
    t.string "radio_location"
    t.string "signature"
    t.string "sketch_upload"
    t.string "add_info"
  end

  add_foreign_key "fallpro_emails", "fallpros"
  add_foreign_key "fallpro_hazards", "fallpros"
  add_foreign_key "fallpro_reverse_steps", "fallpros"
  add_foreign_key "fallpro_steps", "fallpros"
end
