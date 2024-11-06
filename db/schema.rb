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

ActiveRecord::Schema[7.0].define(version: 2024_11_05_022755) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audits", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "supervisor_id", null: false
    t.date "data_auditoria"
    t.text "detalhes"
    t.text "conclusao"
    t.date "proxima_auditoria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_audits_on_patient_id"
    t.index ["supervisor_id"], name: "index_audits_on_supervisor_id"
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

  create_table "clinics", force: :cascade do |t|
    t.string "nome_clinica"
    t.string "endereco"
    t.string "telefone"
    t.string "email"
    t.string "responsavel_clinica"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "nome_plano"
    t.string "endereco"
    t.string "telefone"
    t.string "email"
    t.string "responsavel_plano"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.date "data_avaliacao"
    t.string "tipo_avaliacao"
    t.string "resultado_avaliacao"
    t.text "detalhes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_evaluations_on_patient_id"
  end

  create_table "family_meetings", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.date "data_reuniao"
    t.bigint "supervisor_id", null: false
    t.text "descricao"
    t.text "feedback_familiar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_family_meetings_on_patient_id"
    t.index ["supervisor_id"], name: "index_family_meetings_on_supervisor_id"
  end

  create_table "patient_clinics", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "clinic_id", null: false
    t.date "data_inicio"
    t.date "data_fim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_patient_clinics_on_clinic_id"
    t.index ["patient_id", "clinic_id"], name: "index_patient_clinics_on_patient_id_and_clinic_id", unique: true
    t.index ["patient_id"], name: "index_patient_clinics_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "nome"
    t.date "data_nascimento"
    t.string "diagnostico"
    t.string "responsavel_principal"
    t.string "contato_responsavel"
    t.date "data_entrada"
    t.string "status"
    t.bigint "school_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_patients_on_company_id"
    t.index ["school_id"], name: "index_patients_on_school_id"
  end

  create_table "professionals", force: :cascade do |t|
    t.string "nome"
    t.string "funcao"
    t.string "especialidade"
    t.string "contato"
    t.string "disponibilidade"
    t.bigint "clinic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_professionals_on_clinic_id"
  end

  create_table "report_resumes", force: :cascade do |t|
    t.bigint "report_id", null: false
    t.integer "tokens_used"
    t.text "content"
    t.boolean "deleted", default: false
    t.float "total_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_report_resumes_on_report_id"
  end

  create_table "reports", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.date "date"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_reports_on_patient_id"
  end

  create_table "school_feedbacks", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.date "data_feedback"
    t.text "observacoes"
    t.bigint "supervisor_id", null: false
    t.string "status_acompanhamento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_school_feedbacks_on_patient_id"
    t.index ["supervisor_id"], name: "index_school_feedbacks_on_supervisor_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "nome_escola"
    t.string "endereco"
    t.string "telefone"
    t.string "email"
    t.string "responsavel_escola"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "summaries", force: :cascade do |t|
    t.text "content"
    t.integer "tokens_used"
    t.float "total_time"
    t.bigint "therapeutic_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["therapeutic_session_id"], name: "index_summaries_on_therapeutic_session_id"
  end

  create_table "supervisors", force: :cascade do |t|
    t.string "nome"
    t.string "especialidade"
    t.string "contato"
    t.string "disponibilidade"
    t.bigint "autismia_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["autismia_id"], name: "index_supervisors_on_autismia_id"
  end

  create_table "therapeutic_plans", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.date "data_inicio"
    t.date "data_fim"
    t.text "objetivos"
    t.text "descricao"
    t.integer "carga_horaria"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_therapeutic_plans_on_patient_id"
  end

  create_table "therapeutic_sessions", force: :cascade do |t|
    t.bigint "therapeutic_plan_id", null: false
    t.bigint "professional_id", null: false
    t.bigint "clinic_id", null: false
    t.date "data_sessao"
    t.text "descricao"
    t.text "observacoes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_therapeutic_sessions_on_clinic_id"
    t.index ["professional_id"], name: "index_therapeutic_sessions_on_professional_id"
    t.index ["therapeutic_plan_id"], name: "index_therapeutic_sessions_on_therapeutic_plan_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "last_sign_in_at"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id", null: false
    t.integer "role"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "audits", "patients"
  add_foreign_key "audits", "supervisors"
  add_foreign_key "evaluations", "patients"
  add_foreign_key "family_meetings", "patients"
  add_foreign_key "family_meetings", "supervisors"
  add_foreign_key "patient_clinics", "clinics"
  add_foreign_key "patient_clinics", "patients"
  add_foreign_key "patients", "companies"
  add_foreign_key "patients", "schools"
  add_foreign_key "professionals", "clinics"
  add_foreign_key "report_resumes", "reports"
  add_foreign_key "reports", "patients"
  add_foreign_key "school_feedbacks", "patients"
  add_foreign_key "school_feedbacks", "supervisors"
  add_foreign_key "summaries", "therapeutic_sessions"
  add_foreign_key "supervisors", "autismia", column: "autismia_id"
  add_foreign_key "therapeutic_plans", "patients"
  add_foreign_key "therapeutic_sessions", "clinics"
  add_foreign_key "therapeutic_sessions", "professionals"
  add_foreign_key "therapeutic_sessions", "therapeutic_plans"
  add_foreign_key "users", "companies"
end
