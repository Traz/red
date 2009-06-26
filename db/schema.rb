# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 9) do

  create_table "group_members", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_subgroups", :force => true do |t|
    t.integer  "group_id"
    t.integer  "subgroup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.integer  "permissionnable_id"
    t.string   "permissionnable_type"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "username",                           :null => false
    t.string   "email",                              :null => false
    t.string   "ident",                              :null => false
    t.string   "lastname"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.string   "perishable_token",   :default => "", :null => false
    t.boolean  "remenber_me"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "roles"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["ident"], :name => "index_users_on_ident"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

  create_table "wiki_versions", :force => true do |t|
    t.integer  "wiki_id"
    t.integer  "version"
    t.string   "title"
    t.text     "page"
    t.integer  "owner_id"
    t.integer  "writer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wiki_versions", ["wiki_id"], :name => "index_wiki_versions_on_wiki_id"

  create_table "wikis", :force => true do |t|
    t.string   "title"
    t.text     "page"
    t.integer  "owner_id"
    t.integer  "writer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version"
  end

end
