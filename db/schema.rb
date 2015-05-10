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

ActiveRecord::Schema.define(version: 20150505222713) do

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
  end

  create_table "clasificacions_plays", force: true do |t|
    t.integer "clasificacion_id"
    t.integer "play_id"
  end

  create_table "destrezas", force: true do |t|
    t.string   "nombre"
    t.string   "comentario"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "funcions", force: true do |t|
    t.time     "hora"
    t.string   "comentario"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  create_table "generos_plays", force: true do |t|
    t.integer "genero_id"
    t.integer "play_id"
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
  end

  create_table "tipo_tickets", force: true do |t|
    t.string   "tipo"
    t.float    "precio"
    t.string   "comentario"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
