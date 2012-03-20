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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120218103429) do

  create_table "additional_device_informations", :force => true do |t|
    t.integer  "device_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "additional_device_informations", ["device_id", "key"], :name => "index_additional_device_informations_on_device_id_and_key", :unique => true

  create_table "devices", :force => true do |t|
    t.integer  "user_id"
    t.string   "type"
    t.string   "uuid"
    t.string   "imei"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "devices", ["type", "user_id"], :name => "index_devices_on_type_and_user_id"
  add_index "devices", ["uuid"], :name => "index_devices_on_uuid", :unique => true

  create_table "locations", :force => true do |t|
    t.integer  "device_id"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "locations", ["device_id"], :name => "index_locations_on_device_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "certification_code"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email", "certification_code"], :name => "index_users_on_email_and_certification_code", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
