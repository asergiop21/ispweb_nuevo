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

ActiveRecord::Schema.define(:version => 20130726165134) do

  create_table "accounts_receivables", :force => true do |t|
    t.string   "description"
    t.decimal  "amount",         :precision => 8, :scale => 2
    t.integer  "number_invoice"
    t.integer  "customer_id"
    t.integer  "user_id"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "address"
    t.string   "neighborhood"
    t.string   "reference_direction"
    t.string   "email"
    t.string   "dni"
    t.text     "description"
    t.string   "cuit"
    t.date     "date_of_birth"
    t.boolean  "removed"
    t.string   "bar_code"
    t.string   "category"
    t.integer  "location_id"
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "plan_id"
    t.string   "invoice"
  end

  create_table "equipment", :force => true do |t|
    t.string   "mac"
    t.text     "comment"
    t.integer  "category_id"
    t.integer  "model_id"
    t.integer  "supplier_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "status",      :default => "STOCK"
    t.boolean  "enabled",     :default => true
  end

  create_table "invoices", :force => true do |t|
    t.integer  "number_invoice", :default => 1000
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "ips", :force => true do |t|
    t.string   "ip_ap"
    t.string   "ip_device"
    t.integer  "plan_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "loans", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "equipment_id"
    t.boolean  "confirmation_loan"
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "technical_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "status_loan",       :default => true
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "departament"
    t.string   "zipcode"
    t.string   "province"
    t.string   "country"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "makes", :force => true do |t|
    t.string   "name"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "models", :force => true do |t|
    t.string   "name"
    t.string   "comment"
    t.integer  "make_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "category_id", :null => false
  end

  add_index "models", ["category_id"], :name => "index_models_on_category_id"

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "phones", :force => true do |t|
    t.string   "phone_number"
    t.string   "phone_prefix"
    t.string   "phone"
    t.integer  "user_id"
    t.integer  "customer_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "phones", ["customer_id"], :name => "index_phones_on_customer_id"
  add_index "phones", ["user_id"], :name => "index_phones_on_user_id"

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.decimal  "price",                   :precision => 8, :scale => 2
    t.string   "upload_speed"
    t.string   "download_speed"
    t.boolean  "remove"
    t.decimal  "price_surcharges1",       :precision => 8, :scale => 2
    t.decimal  "price_surcharges2",       :precision => 8, :scale => 2
    t.integer  "user_id"
    t.datetime "created_at",                                                               :null => false
    t.datetime "updated_at",                                                               :null => false
    t.integer  "support_priority"
    t.integer  "percentage_junk"
    t.string   "upload_speed_vampire"
    t.string   "download_speed_vampire"
    t.string   "percentage_junk_vampire"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "enable_vampire",                                        :default => false
  end

  create_table "roles", :force => true do |t|
    t.string   "role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_and_permissions", :force => true do |t|
    t.string   "scope"
    t.integer  "role_id"
    t.integer  "permmision_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles_and_permissions", ["permmision_id"], :name => "index_roles_and_permissions_on_permmision_id"
  add_index "roles_and_permissions", ["role_id"], :name => "index_roles_and_permissions_on_role_id"

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "location_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ticket_and_roles", :force => true do |t|
    t.integer  "ticket_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "ticket_answers", :force => true do |t|
    t.string   "message"
    t.integer  "user_id"
    t.integer  "ticket_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tickets", :force => true do |t|
    t.string   "issue"
    t.text     "message"
    t.string   "status",      :default => "pendiente"
    t.integer  "role_id"
    t.string   "priority"
    t.text     "reply"
    t.integer  "user_id"
    t.integer  "path_id"
    t.integer  "customer_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "ancestry"
    t.string   "prioritycss"
  end

  add_index "tickets", ["ancestry"], :name => "index_tickets_on_ancestry"

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
    t.string   "username"
    t.string   "lastname"
    t.string   "name"
    t.string   "address"
    t.integer  "role_id"
    t.string   "cuit"
    t.string   "dni"
    t.boolean  "enabled"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["role_id"], :name => "index_users_on_role_id"

end
