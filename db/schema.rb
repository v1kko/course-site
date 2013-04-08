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

ActiveRecord::Schema.define(:version => 20130408134433) do

  create_table "answers", :force => true do |t|
    t.integer  "user_id"
    t.text     "answer_data"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "pset_id"
  end

  add_index "answers", ["user_id"], :name => "index_answers_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.integer  "subpage_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comment_threads", :force => true do |t|
    t.string   "title"
    t.integer  "page_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.text     "orig_content"
    t.integer  "comment_thread_id"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "dones", :force => true do |t|
    t.integer  "user_id"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "dones", ["user_id"], :name => "index_dones_on_user_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.string   "reference"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.integer  "section_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
    t.string   "path"
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug", :unique => true

  create_table "progresses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "page_id"
    t.boolean  "done"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pset_files", :force => true do |t|
    t.string   "filename"
    t.boolean  "required"
    t.integer  "pset_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pset_files", ["pset_id"], :name => "index_pset_files_on_pset_id"

  create_table "psets", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "page_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "form"
    t.text     "message"
  end

  add_index "psets", ["page_id"], :name => "index_psets_on_page_id"

  create_table "sections", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
    t.string   "path"
  end

  add_index "sections", ["slug"], :name => "index_sections_on_slug", :unique => true

  create_table "submits", :force => true do |t|
    t.integer  "user_id"
    t.integer  "pset_id"
    t.datetime "submitted_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "submits", ["pset_id"], :name => "index_submits_on_pset_id"
  add_index "submits", ["user_id"], :name => "index_submits_on_user_id"

  create_table "subpages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "position"
    t.integer  "page_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "subpages", ["slug"], :name => "index_subpages_on_slug", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "uvanetid"
    t.string   "mail"
    t.string   "avatar"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "group_id"
  end

end
