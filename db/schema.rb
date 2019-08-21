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

ActiveRecord::Schema.define(version: 2019_08_21_124928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meal_tags", force: :cascade do |t|
    t.bigint "meal_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_meal_tags_on_meal_id"
    t.index ["tag_id"], name: "index_meal_tags_on_tag_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.string "description"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_meals_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "front_photo"
    t.string "description"
    t.float "longitude"
    t.float "latitude"
    t.string "food_style"
    t.string "menu_language"
    t.string "photos"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_restaurants_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.string "icon"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "meal_tags", "meals"
  add_foreign_key "meal_tags", "tags"
  add_foreign_key "meals", "restaurants"
  add_foreign_key "restaurants", "users"
end
