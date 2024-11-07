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

ActiveRecord::Schema[7.2].define(version: 2024_11_07_025754) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auditoria", force: :cascade do |t|
    t.bigint "beneficiario_id", null: false
    t.bigint "supervisor_id", null: false
    t.date "data_auditoria"
    t.text "detalhes"
    t.text "conclusao"
    t.date "proxima_auditoria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beneficiario_id"], name: "index_auditoria_on_beneficiario_id"
    t.index ["supervisor_id"], name: "index_auditoria_on_supervisor_id"
  end

  create_table "autismia", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "telefone"
    t.string "email"
    t.string "responsavel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "avaliacaos", force: :cascade do |t|
    t.bigint "beneficiario_id", null: false
    t.date "data_avaliacao"
    t.string "tipo_avaliacao"
    t.text "resultado_avaliacao"
    t.text "detalhes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beneficiario_id"], name: "index_avaliacaos_on_beneficiario_id"
  end

  create_table "beneficiarios", force: :cascade do |t|
    t.string "nome"
    t.date "data_nascimento"
    t.text "diagnostico"
    t.string "responsavel_principal"
    t.string "contato_responsavel"
    t.date "data_entrada"
    t.date "data_saida"
    t.string "status"
    t.bigint "escola_id", null: false
    t.bigint "plano_saude_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["escola_id"], name: "index_beneficiarios_on_escola_id"
    t.index ["plano_saude_id"], name: "index_beneficiarios_on_plano_saude_id"
  end

  create_table "beneficiarios_clinicas", force: :cascade do |t|
    t.bigint "beneficiarios_id", null: false
    t.bigint "clinicas_id", null: false
    t.date "data_inicio"
    t.date "data_fim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beneficiarios_id"], name: "index_beneficiarios_clinicas_on_beneficiarios_id"
    t.index ["clinicas_id"], name: "index_beneficiarios_clinicas_on_clinicas_id"
  end

  create_table "clinicas", force: :cascade do |t|
    t.string "nome_clinica"
    t.string "endereco"
    t.string "telefone"
    t.string "email"
    t.string "responsavel_clinica"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "escolas", force: :cascade do |t|
    t.string "nome_escola"
    t.string "endereco"
    t.string "telefone"
    t.string "email"
    t.string "responsavel_escola"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedback_escolas", force: :cascade do |t|
    t.bigint "beneficiario_id", null: false
    t.bigint "supervisor_id", null: false
    t.date "data_feedback"
    t.text "observacoes"
    t.string "status_acompanhamento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beneficiario_id"], name: "index_feedback_escolas_on_beneficiario_id"
    t.index ["supervisor_id"], name: "index_feedback_escolas_on_supervisor_id"
  end

  create_table "plano_saudes", force: :cascade do |t|
    t.string "nome_plano"
    t.string "endereco"
    t.string "telefone"
    t.string "email"
    t.string "responsavel_plano"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plano_terapeuticos", force: :cascade do |t|
    t.bigint "beneficiario_id", null: false
    t.date "data_inicio"
    t.date "data_fim"
    t.text "objetivos"
    t.text "descricao"
    t.integer "carga_horaria"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beneficiario_id"], name: "index_plano_terapeuticos_on_beneficiario_id"
  end

  create_table "profissionals", force: :cascade do |t|
    t.string "nome"
    t.string "funcao"
    t.string "especialidade"
    t.string "contato"
    t.string "disponibilidade"
    t.bigint "clinica_id", null: false
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinica_id"], name: "index_profissionals_on_clinica_id"
    t.index ["email"], name: "index_profissionals_on_email", unique: true
  end

  create_table "reuniao_familiars", force: :cascade do |t|
    t.bigint "beneficiario_id", null: false
    t.bigint "supervisor_id", null: false
    t.datetime "data_reuniao"
    t.text "descricao"
    t.text "feedback_familiar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beneficiario_id"], name: "index_reuniao_familiars_on_beneficiario_id"
    t.index ["supervisor_id"], name: "index_reuniao_familiars_on_supervisor_id"
  end

  create_table "sessao_terapeuticas", force: :cascade do |t|
    t.bigint "plano_terapeuticos_id", null: false
    t.bigint "profissional_id", null: false
    t.bigint "clinica_id", null: false
    t.datetime "data_sessao"
    t.text "descricao"
    t.text "observacoes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinica_id"], name: "index_sessao_terapeuticas_on_clinica_id"
    t.index ["plano_terapeuticos_id"], name: "index_sessao_terapeuticas_on_plano_terapeuticos_id"
    t.index ["profissional_id"], name: "index_sessao_terapeuticas_on_profissional_id"
  end

  create_table "supervisors", force: :cascade do |t|
    t.string "nome"
    t.string "especialidade"
    t.string "contato"
    t.string "disponibilidade"
    t.bigint "autismia_id", null: false
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["autismia_id"], name: "index_supervisors_on_autismia_id"
    t.index ["email"], name: "index_supervisors_on_email", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "auditoria", "beneficiarios"
  add_foreign_key "auditoria", "supervisors"
  add_foreign_key "avaliacaos", "beneficiarios"
  add_foreign_key "beneficiarios", "escolas"
  add_foreign_key "beneficiarios", "plano_saudes"
  add_foreign_key "beneficiarios_clinicas", "beneficiarios", column: "beneficiarios_id"
  add_foreign_key "beneficiarios_clinicas", "clinicas", column: "clinicas_id"
  add_foreign_key "feedback_escolas", "beneficiarios"
  add_foreign_key "feedback_escolas", "supervisors"
  add_foreign_key "plano_terapeuticos", "beneficiarios"
  add_foreign_key "profissionals", "clinicas"
  add_foreign_key "reuniao_familiars", "beneficiarios"
  add_foreign_key "reuniao_familiars", "supervisors"
  add_foreign_key "sessao_terapeuticas", "clinicas"
  add_foreign_key "sessao_terapeuticas", "plano_terapeuticos", column: "plano_terapeuticos_id"
  add_foreign_key "sessao_terapeuticas", "profissionals"
  add_foreign_key "supervisors", "autismia", column: "autismia_id"
end
