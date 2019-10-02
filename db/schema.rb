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

ActiveRecord::Schema.define(version: 2019_10_02_041522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gif_messages", force: :cascade do |t|
    t.integer "gif_id"
    t.integer "message_id"
    t.integer "position"
    t.index ["gif_id"], name: "index_gif_messages_on_gif_id"
    t.index ["message_id"], name: "index_gif_messages_on_message_id"
  end

  create_table "gifs", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "header", default: ""
    t.string "footer", default: ""
    t.integer "sender_id"
    t.integer "receiver_id"
    t.boolean "sent", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_messages_on_receiver_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_relationships_on_contact_id"
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "user_gifs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "gif_id"
    t.index ["gif_id"], name: "index_user_gifs_on_gif_id"
    t.index ["user_id"], name: "index_user_gifs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "password_digest"
    t.text "auth_token"
  end

end
