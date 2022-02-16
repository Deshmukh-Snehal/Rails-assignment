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

ActiveRecord::Schema.define(version: 2022_02_16_043720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string "awards"
    t.string "medals"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "player"
    t.string "status"
    t.integer "user_id"
    t.index ["user_id"], name: "index_achievements_on_user_id"
  end

  create_table "annocements", force: :cascade do |t|
    t.text "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sport_id"
    t.integer "user_id"
    t.index ["sport_id"], name: "index_annocements_on_sport_id"
    t.index ["user_id"], name: "index_annocements_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_id"
    t.integer "sport_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["sport_id"], name: "index_comments_on_sport_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "hashtags", force: :cascade do |t|
    t.string "tagable_type"
    t.bigint "tagable_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tagable_type", "tagable_id"], name: "index_hashtags_on_tagable_type_and_tagable_id"
  end

  create_table "playerdetails", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "state"
    t.string "country"
    t.string "mobile_no"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sport_id"
    t.integer "user_id"
    t.index ["user_id"], name: "index_playerdetails_on_user_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sport"
    t.string "image"
    t.string "email"
    t.integer "user_id"
    t.integer "sport_id"
    t.string "name"
    t.string "state"
    t.string "city"
    t.string "country"
    t.string "mobileno"
    t.index ["sport_id"], name: "index_players_on_sport_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "post_attachments", force: :cascade do |t|
    t.integer "post_id"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sport_id"
    t.string "sport"
    t.string "image"
    t.integer "user_id"
    t.integer "player_id"
    t.index ["player_id"], name: "index_posts_on_player_id"
    t.index ["sport_id"], name: "index_posts_on_sport_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "sport_name"
    t.string "sport_equipments"
    t.bigint "sport_player"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "user_id"
    t.index ["slug"], name: "index_sports_on_slug", unique: true
    t.index ["user_id"], name: "index_sports_on_user_id"
  end

  create_table "tag_infos", force: :cascade do |t|
    t.string "title"
    t.string "player"
    t.string "post"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_id"
    t.integer "post_id"
    t.index ["player_id"], name: "index_tag_infos_on_player_id"
    t.index ["post_id"], name: "index_tag_infos_on_post_id"
  end

  create_table "tagnames", force: :cascade do |t|
    t.string "tagable_type"
    t.bigint "tagable_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tagable_type", "tagable_id"], name: "index_tagnames_on_tagable_type_and_tagable_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
