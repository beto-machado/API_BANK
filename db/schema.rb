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

ActiveRecord::Schema.define(version: 2021_10_29_212516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bank_accounts", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.string "account_number", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "balance_in_cents"
    t.index ["account_number"], name: "index_bank_accounts_on_account_number", unique: true
    t.index ["person_id"], name: "index_bank_accounts_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.date "birthdate", null: false
    t.string "cpf_photo"
    t.string "rg", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rg"], name: "index_people_on_rg", unique: true
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "bank_account_id", null: false
    t.string "kind", null: false
    t.bigint "amount_in_cents", null: false
    t.datetime "transaction_hour", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bank_account_id"], name: "index_transactions_on_bank_account_id"
  end

  add_foreign_key "bank_accounts", "people"
end
