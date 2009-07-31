# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 3) do

  create_table "contacts", :force => true do |t|
    t.string   "forename"
    t.string   "surname"
    t.date     "dob"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["id", "user_id"], :name => "contact_pk", :unique => true

  create_table "telephone_numbers", :force => true do |t|
    t.integer  "type"
    t.string   "value"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",           :limit => 80,                 :null => false
    t.string   "email",           :limit => 256,                :null => false
    t.string   "salted_password", :limit => 40,                 :null => false
    t.string   "firstname",       :limit => 40
    t.string   "lastname",        :limit => 40
    t.string   "salt",            :limit => 40,                 :null => false
    t.integer  "verified",                       :default => 0
    t.string   "role",            :limit => 40
    t.string   "security_token",  :limit => 40
    t.datetime "token_expiry"
    t.integer  "deleted",                        :default => 0
    t.datetime "delete_after"
  end

  add_index "users", ["id"], :name => "user_pk", :unique => true

end
