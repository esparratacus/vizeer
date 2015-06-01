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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150530212205) do

  create_table "appointments", force: :cascade do |t|
    t.integer  "consejero_id", limit: 4
    t.integer  "alumno_id",    limit: 4
    t.datetime "fecha"
    t.string   "estado",       limit: 255
    t.text     "reporte",      limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "course_id",  limit: 4
    t.text     "comentario", limit: 65535
    t.integer  "negativo",   limit: 4
    t.integer  "positivo",   limit: 4
    t.integer  "denuncias",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "comments", ["course_id"], name: "index_comments_on_course_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "nombre",           limit: 255
    t.text     "descripcion",      limit: 65535
    t.integer  "creditos",         limit: 4
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.decimal  "intensidad",                     precision: 10, default: 0
    t.decimal  "dificultad",                     precision: 10, default: 0
    t.decimal  "utilidad",                       precision: 10, default: 0
    t.integer  "numero_encuestas", limit: 4,                    default: 0
    t.integer  "dif_sum",          limit: 4,                    default: 0
    t.integer  "inten_sum",        limit: 4,                    default: 0
    t.integer  "util_sum",         limit: 4,                    default: 0
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.integer "user_id",   limit: 4, null: false
    t.integer "course_id", limit: 4, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "schedules", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "dia_semana",  limit: 255
    t.time     "hora_inicio"
    t.time     "hora_fin"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "schedules", ["user_id"], name: "index_schedules_on_user_id", using: :btree

  create_table "sections", force: :cascade do |t|
    t.integer  "course_id",  limit: 4
    t.string   "semestre",   limit: 255
    t.boolean  "estado",     limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sections", ["course_id"], name: "index_sections_on_course_id", using: :btree

  create_table "sections_users", id: false, force: :cascade do |t|
    t.integer "user_id",    limit: 4, null: false
    t.integer "section_id", limit: 4, null: false
  end

  add_index "sections_users", ["section_id", "user_id"], name: "index_sections_users_on_section_id_and_user_id", using: :btree
  add_index "sections_users", ["user_id", "section_id"], name: "index_sections_users_on_user_id_and_section_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "comments", "courses"
  add_foreign_key "comments", "users"
  add_foreign_key "schedules", "users"
  add_foreign_key "sections", "courses"
end
