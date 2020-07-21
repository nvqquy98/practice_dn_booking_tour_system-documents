# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_02_083412) do

  create_table "blogs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "title"
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "created_at"], name: "index_blogs_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "books", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "tour_id", null: false
    t.bigint "user_contact_id", null: false
    t.integer "quantity"
    t.decimal "total", precision: 10, scale: 2
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tour_id", "status"], name: "index_books_on_tour_id_and_status"
    t.index ["tour_id"], name: "index_books_on_tour_id"
    t.index ["user_contact_id"], name: "index_books_on_user_contact_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "international"
    t.string "national"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "image_type_type"
    t.bigint "image_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image_type_type", "image_type_id"], name: "index_images_on_image_type_type_and_image_type_id"
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "context"
    t.string "review_type_type"
    t.bigint "review_type_id"
    t.integer "user_id", null: false
    t.integer "repply_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["repply_id"], name: "index_reviews_on_repply_id"
    t.index ["review_type_type", "review_type_id"], name: "index_reviews_on_review_type_type_and_review_type_id"
    t.index ["user_id", "created_at"], name: "index_reviews_on_user_id_and_created_at"
    t.index ["user_id", "repply_id"], name: "index_reviews_on_user_id_and_repply_id"
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "tag_type_type"
    t.bigint "tag_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tag_type_type", "tag_type_id"], name: "index_tags_on_tag_type_type_and_tag_type_id"
  end

  create_table "tour_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "tour_id", null: false
    t.decimal "sale", precision: 3, scale: 2
    t.decimal "price", precision: 10, scale: 2
    t.integer "maximum_people"
    t.integer "current_people"
    t.datetime "start_at"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maximum_people", "current_people"], name: "index_tour_details_on_maximum_people_and_current_people"
    t.index ["price", "sale"], name: "index_tour_details_on_price_and_sale"
    t.index ["price"], name: "index_tour_details_on_price"
    t.index ["status"], name: "index_tour_details_on_status"
    t.index ["tour_id"], name: "index_tour_details_on_tour_id"
  end

  create_table "tours", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "title"
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_tours_on_category_id"
    t.index ["user_id", "created_at"], name: "index_tours_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_tours_on_user_id"
  end

  create_table "user_contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "adress"
    t.string "phone_number"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "phone_number"], name: "index_user_contacts_on_user_id_and_phone_number"
    t.index ["user_id"], name: "index_user_contacts_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.datetime "remmber_at"
    t.string "active_digest"
    t.boolean "activated"
    t.datetime "activated_at"
    t.string "reset_password_digest"
    t.datetime "reset_password_at"
    t.integer "permission", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "blogs", "users"
  add_foreign_key "books", "tours"
  add_foreign_key "books", "user_contacts"
  add_foreign_key "tour_details", "tours"
  add_foreign_key "tours", "categories"
  add_foreign_key "tours", "users"
  add_foreign_key "user_contacts", "users"
end
