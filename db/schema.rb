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

ActiveRecord::Schema.define(:version => 20121007191926) do

  create_table "conflicting_requirements", :force => true do |t|
    t.integer "requirement_id",             :null => false
    t.integer "conflicting_requirement_id", :null => false
  end

  create_table "conflicts", :force => true do |t|
    t.integer  "requirement_id"
    t.integer  "conflicting_requirement_id"
    t.string   "requirement_type"
    t.string   "conflicting_requirement_type"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "dependencies", :force => true do |t|
    t.integer  "requirement_id"
    t.integer  "dependent_requirement_id"
    t.string   "requirement_type"
    t.string   "dependent_requirement_type"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "p_lang_requirements", :force => true do |t|
    t.text     "tag",            :limit => 255
    t.text     "gist",           :limit => 255
    t.text     "stakeholder",    :limit => 255
    t.text     "scale",          :limit => 255
    t.text     "meter",          :limit => 255
    t.text     "must",           :limit => 255
    t.text     "plan",           :limit => 255
    t.text     "stretch",        :limit => 255
    t.text     "wish",           :limit => 255
    t.text     "past",           :limit => 255
    t.text     "trend",          :limit => 255
    t.text     "record",         :limit => 255
    t.text     "defined",        :limit => 255
    t.text     "authority",      :limit => 255
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "identification"
    t.integer  "position"
    t.string   "short_name"
  end

  create_table "related_requirements", :force => true do |t|
    t.integer "requirement_id",         :null => false
    t.integer "related_requirement_id", :null => false
  end

  create_table "relations", :force => true do |t|
    t.integer  "requirement_id"
    t.integer  "related_requirement_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "requirement_type"
    t.string   "related_requirement_type"
  end

  create_table "requirement_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "short_name"
  end

  create_table "requirements", :force => true do |t|
    t.text     "description"
    t.text     "rationale"
    t.string   "originator"
    t.text     "fit_criterion"
    t.text     "customer_satisfaction"
    t.text     "customer_dissatisfaction"
    t.string   "priority"
    t.text     "supporting_materials"
    t.text     "history"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "requirement_type_id"
    t.string   "identification"
    t.integer  "author_id"
    t.integer  "position"
    t.string   "short_name"
  end

  create_table "users", :force => true do |t|
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
