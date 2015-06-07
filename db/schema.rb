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

ActiveRecord::Schema.define(version: 20150607010905) do

  create_table "actors", force: true do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "identity"
    t.string   "email"
    t.string   "facebook_profile"
    t.text     "biography"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
  end

  create_table "actors_destrezas", force: true do |t|
    t.integer "actor_id"
    t.integer "destreza_id"
  end

  create_table "actors_plays", force: true do |t|
    t.integer "actor_id"
    t.integer "play_id"
  end

  create_table "clasificacions", force: true do |t|
    t.string   "nombre"
    t.integer  "edadMin"
    t.integer  "edadMax"
    t.string   "comentario"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  create_table "destrezas", force: true do |t|
    t.string   "nombre"
    t.string   "comentario"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  create_table "feedbacks", force: true do |t|
    t.integer  "age"
    t.string   "title"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "funcions", force: true do |t|
    t.time     "hora"
    t.string   "comentario"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.integer  "cant_disponible"
  end

  create_table "funcions_plays", force: true do |t|
    t.integer "funcion_id"
    t.integer "play_id"
  end

  create_table "generos", force: true do |t|
    t.string   "nombre"
    t.string   "comentario"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  create_table "generos_plays", force: true do |t|
    t.integer "genero_id"
    t.integer "play_id"
  end

  create_table "info_generals", force: true do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "email"
    t.string   "fb"
    t.string   "tw"
    t.string   "youtube"
    t.string   "ig"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: true do |t|
    t.string   "title"
    t.string   "text"
    t.string   "picture"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plays", force: true do |t|
    t.string   "title"
    t.text     "summary"
    t.string   "promotional_video"
    t.integer  "duration"
    t.date     "end_date"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "clasificacion_id"
    t.integer  "theater_id"
    t.string   "picture"
  end

  create_table "theaters", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  create_table "ticket_reservations", force: true do |t|
    t.string   "name"
    t.string   "identity"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "play_id"
    t.float    "total_price"
    t.integer  "total_tickets"
    t.datetime "date"
    t.string   "token"
    t.string   "state"
  end

  create_table "tipo_tickets", force: true do |t|
    t.string   "tipo"
    t.float    "precio"
    t.string   "comentario"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
