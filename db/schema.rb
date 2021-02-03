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

ActiveRecord::Schema.define(version: 20180831150309) do

  create_table "assets", force: :cascade do |t|
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "panorama_asset_file_name",    limit: 255
    t.string   "panorama_asset_content_type", limit: 255
    t.integer  "panorama_asset_file_size"
    t.datetime "panorama_asset_updated_at"
  end

  create_table "buildings", force: :cascade do |t|
    t.string   "building_code_heprod", limit: 255
    t.integer  "location_id"
    t.string   "address",              limit: 255
    t.string   "address2",             limit: 255
    t.string   "city",                 limit: 255, default: "Ann Arbor"
    t.string   "state",                limit: 255, default: "Mi"
    t.string   "zip",                  limit: 255, default: "48109"
    t.text     "description"
    t.text     "history"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "building_short_code",  limit: 255
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string   "room_number",                     limit: 255
    t.string   "facility_code_heprod",            limit: 255
    t.integer  "student_capacity"
    t.boolean  "light_control"
    t.boolean  "layout_platform"
    t.boolean  "layout_stage"
    t.boolean  "layout_tiered"
    t.boolean  "seating_auditorium"
    t.boolean  "seating_chairs_fixed"
    t.boolean  "seating_movable_tables_chairs"
    t.boolean  "seating_table_conference"
    t.boolean  "seating_tables_any"
    t.boolean  "seating_tables_fixed"
    t.boolean  "seating_tables_moveable"
    t.boolean  "sound_amplification"
    t.boolean  "ethernet_students"
    t.boolean  "power_students"
    t.boolean  "writing_surface_chalkboard_any"
    t.boolean  "writing_surface_chalkboard_25ft"
    t.boolean  "writing_surface_whiteboard_any"
    t.boolean  "writing_surface_whiteboard_25ft"
    t.boolean  "computer_classroom_any"
    t.boolean  "computer_classroom_mac"
    t.boolean  "computer_classroom_windows"
    t.boolean  "assisted_listening"
    t.boolean  "wheelchair_instructor"
    t.boolean  "dvd_player_regular"
    t.boolean  "dvd_player_blueray"
    t.boolean  "captioning_device"
    t.boolean  "podium_computer_any"
    t.boolean  "podium_computer_mac"
    t.boolean  "podium_computer_windows"
    t.boolean  "document_camera"
    t.boolean  "interactive_pen"
    t.boolean  "lecture_capture"
    t.boolean  "telephone"
    t.boolean  "video_conferencing"
    t.boolean  "projection_16mm_film"
    t.boolean  "projection_35mm_file"
    t.boolean  "projection_digital_data_video"
    t.boolean  "projection_traditional_slide"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "building_id"
    t.boolean  "is_department_space",                         default: false
    t.integer  "owner_id",                                    default: 1
    t.integer  "rmrecnbr"
    t.string   "DEPT_GRP",                        limit: 255
    t.boolean  "sound_amplification_voice"
    t.string   "building_short_code"
    t.boolean  "team_tables"
    t.boolean  "team_technology"
    t.boolean  "team_writing_surface"
  end

  create_table "locations", force: :cascade do |t|
    t.float    "latitude",                   limit: 255
    t.float    "longitude",                  limit: 255
    t.string   "name",                       limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "gmaps"
    t.string   "type",                       limit: 255
    t.integer  "locatable_id"
    t.string   "locatable_type",             limit: 255
    t.string   "image",                      limit: 255
    t.string   "picture_file_name",          limit: 255
    t.string   "picture_content_type",       limit: 255
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "building_sign_file_name",    limit: 255
    t.string   "building_sign_content_type", limit: 255
    t.integer  "building_sign_file_size"
    t.datetime "building_sign_updated_at"
    t.boolean  "visible",                                default: true
  end

  add_index "locations", ["locatable_id", "locatable_type"], name: "index_locations_on_locatable_id_and_locatable_type"

  create_table "owners", force: :cascade do |t|
    t.string   "department_name", limit: 255
    t.string   "facility_id",     limit: 255
    t.string   "contact_name",    limit: 255
    t.string   "contact_phone",   limit: 255
    t.string   "contact_email",   limit: 255
    t.text     "notes"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "url",             limit: 255
  end

  create_table "room_attributes", force: :cascade do |t|
    t.integer  "RMRECNBR"
    t.integer  "CHRSTC"
    t.string   "CHRSTC_DESCR",      limit: 255
    t.string   "CHRSTC_DESCRSHORT", limit: 255
    t.string   "CHRSTC_DESCR254",   limit: 255
    t.boolean  "CHRSTC_SCHEDULE"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "room_schedule_contacts", force: :cascade do |t|
    t.integer  "rmrecnbr"
    t.string   "rm_schd_cntct_name",   limit: 255
    t.string   "rm_schd_email",        limit: 255
    t.string   "rm_schd_cntct_phone",  limit: 255
    t.string   "rm_det_url",           limit: 255
    t.string   "rm_usage_guidlns_url", limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "RM_SPPT_DEPTID",       limit: 255
    t.string   "RM_SPPT_DEPT_DESCR",   limit: 255
    t.string   "RM_SPPT_CNTCT_EMAIL",  limit: 255
    t.string   "RM_SPPT_CNTCT_PHONE",  limit: 255
    t.string   "RM_SPPT_CNTCT_URL",    limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 128, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
