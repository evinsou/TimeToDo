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

ActiveRecord::Schema.define(:version => 20110721185830) do

  create_table "agile_labors", :force => true do |t|
    t.text     "body",       :limit => 255
    t.string   "labor_type"
    t.string   "exec_order"
    t.datetime "start_in"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_tasks", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "task_id"
  end

  create_table "durations", :force => true do |t|
    t.string   "time_limit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "durations_tasks", :id => false, :force => true do |t|
    t.integer "duration_id"
    t.integer "task_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tasks", :force => true do |t|
    t.string   "body"
    t.datetime "start_in"
    t.date     "finish_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "position"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "hashed_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
