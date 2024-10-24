# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_10_23_135129) do
  create_table "broadcasts", force: :cascade do |t|
    t.string "title"
    t.datetime "broadcast_date"
    t.integer "subscriptions_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.boolean "watched"
    t.string "email"
    t.string "firstname"
    t.string "surname"
    t.string "registration_ip"
    t.integer "broadcast_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.index ["broadcast_id"], name: "index_subscribers_on_broadcast_id"
  end

  add_foreign_key "subscribers", "broadcasts"
end
