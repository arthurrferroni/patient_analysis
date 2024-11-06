Company.destroy_all
Autismia.destroy_all
Supervisor.destroy_all
School.destroy_all
Clinic.destroy_all
Professional.destroy_all
Patient.destroy_all
PatientClinic.destroy_all
TherapeuticPlan.destroy_all
TherapeuticSession.destroy_all


# Criar uma organização Autismia
autismia = Autismia.create!(
  nome: "AutismIA",
  endereco: "Rua Principal, 123",
  telefone: "1234-5678",
  email: "contato@autismia.com",
  responsavel: "Dr. Silva"
)

# Criar Supervisores
supervisor = Supervisor.create!(
  nome: "Ana Supervisor",
  especialidade: "Psicologia",
  contato: "9876-5432",
  disponibilidade: "Segunda a Sexta",
  autismia: autismia
)

# Criar uma Escola
school = School.create!(
  nome_escola: "Escola ABC",
  endereco: "Rua Escolar, 456",
  telefone: "1122-3344",
  email: "contato@escolaabc.com",
  responsavel_escola: "Diretor João"
)

# Criar uma Clínica
clinic = Clinic.create!(
  nome_clinica: "Clínica Saúde",
  endereco: "Avenida Saúde, 789",
  telefone: "5566-7788",
  email: "contato@clinicasaude.com",
  responsavel_clinica: "Dra. Maria"
)

# Criar um Profissional
professional = Professional.create!(
  nome: "Dr. Pedro",
  funcao: "Terapeuta",
  especialidade: "Fonoaudiologia",
  contato: "9988-7766",
  disponibilidade: "Terça e Quinta",
  clinic: clinic
)

# Criar um Plano de Saúde (Company)
company = Company.create!(
  nome_plano: "Plano Saúde Total",
  endereco: "Rua Planos, 101",
  telefone: "3344-5566",
  email: "contato@planosaude.com",
  responsavel_plano: "Sr. Carlos"
)
company2 = Company.create!(
  nome_plano: "Plano Saúde Total2",
  endereco: "Rua Planos, 1012",
  telefone: "3344-55662",
  email: "contato@planosaude222.com",
  responsavel_plano: "Sr. Carlos22"
)

# Criar um Paciente (Patient)
patient = Patient.create!(
  nome: "Joãozinho",
  data_nascimento: "2010-05-15",
  diagnostico: "TEA",
  responsavel_principal: "Maria",
  contato_responsavel: "7766-5544",
  data_entrada: Date.today,
  status: "Ativo",
  school: school,
  company: company
)

# Associar o paciente à clínica
PatientClinic.create!(
  patient: patient,
  clinic: clinic,
  data_inicio: Date.today
)

# Criar um Plano Terapêutico para o paciente
therapeutic_plan = TherapeuticPlan.create!(
  patient: patient,
  data_inicio: Date.today,
  objetivos: "Melhorar comunicação",
  descricao: "Plano intensivo de terapia",
  carga_horaria: 20,
  status: "Em andamento"
)

# Criar uma Sessão Terapêutica
TherapeuticSession.create!(
  therapeutic_plan: therapeutic_plan,
  professional: professional,
  clinic: clinic,
  data_sessao: Date.today,
  descricao: "Sessão inicial",
  observacoes: "Paciente colaborativo"
)

admin_user = User.create!(
  name: "Administrador",
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password",
  company: company,
  role: 'admin'
)
company_user = User.create!(
  name: "Usuário Empresa",
  email: "user@example.com",
  password: "password",
  password_confirmation: "password",
  company: company2,
  role: 'company_user'
)