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

ActiveRecord::Schema.define(version: 20150417010054) do

  create_table "comentarios", force: :cascade do |t|
    t.text     "descripcion"
    t.integer  "usuario_id"
    t.integer  "comentable_id"
    t.string   "comentable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "comentarios", ["comentable_id", "comentable_type"], name: "index_comentarios_on_comentable_id_and_comentable_type"
  add_index "comentarios", ["usuario_id"], name: "index_comentarios_on_usuario_id"

  create_table "groupinv_proyectos", force: :cascade do |t|
    t.integer  "groupinv_id"
    t.integer  "proyecto_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "groupinv_proyectos", ["groupinv_id"], name: "index_groupinv_proyectos_on_groupinv_id"
  add_index "groupinv_proyectos", ["proyecto_id"], name: "index_groupinv_proyectos_on_proyecto_id"

  create_table "groupinv_usuarios", force: :cascade do |t|
    t.integer  "groupinv_id"
    t.integer  "usuario_id"
    t.boolean  "administrador"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "proyecto_id"
  end

  add_index "groupinv_usuarios", ["groupinv_id"], name: "index_groupinv_usuarios_on_groupinv_id"
  add_index "groupinv_usuarios", ["proyecto_id"], name: "index_groupinv_usuarios_on_proyecto_id"
  add_index "groupinv_usuarios", ["usuario_id"], name: "index_groupinv_usuarios_on_usuario_id"

  create_table "groupinvs", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "personasMin"
    t.integer  "personasMax"
    t.decimal  "montoIngreso",    precision: 12, scale: 2
    t.decimal  "montoMensual",    precision: 12, scale: 2
    t.boolean  "esAdministrador"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proyectos", force: :cascade do |t|
    t.string   "nombre"
    t.decimal  "cuota_inicial", precision: 12, scale: 2
    t.decimal  "cuota_mensual", precision: 12, scale: 2
    t.integer  "usuario_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "proyectos", ["usuario_id"], name: "index_proyectos_on_usuario_id"

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                        null: false
    t.string   "crypted_password",             null: false
    t.string   "salt",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "nombre"
    t.string   "apellido"
    t.boolean  "es_empresa"
    t.string   "razon_social"
    t.string   "imagen"
  end

  add_index "usuarios", ["activation_token"], name: "index_usuarios_on_activation_token"
  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true
  add_index "usuarios", ["remember_me_token"], name: "index_usuarios_on_remember_me_token"

end
