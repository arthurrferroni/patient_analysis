# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Autismia.destroy_all
Supervisor.destroy_all
PlanoSaude.destroy_all
Escola.destroy_all
Clinica.destroy_all
Beneficiario.destroy_all
BeneficiariosClinica.destroy_all
Avaliacao.destroy_all
PlanoTerapeutico.destroy_all
Profissional.destroy_all
SessaoTerapeutica.destroy_all
Auditoria.destroy_all
ReuniaoFamiliar.destroy_all
FeedbackEscola.destroy_all


User.create!(
  email: 'teste@exemplo.com',
  password: 'senha123'
)
# db/seeds.rb

# Criar uma entrada em Autismia
autismia = Autismia.create!(
  nome: "AutismIA",
  endereco: "Rua Exemplo, 123",
  telefone: "(11) 1234-5678",
  email: "contato@autismia.com",
  responsavel: "Dr. Silva"
)

# Criar uma entrada em Supervisor
supervisor = Supervisor.create!(
  nome: "Supervisor 1",
  especialidade: "Psicologia",
  contato: "(11) 9876-5432",
  disponibilidade: "Segunda a Sexta",
  autismia_id: autismia.id,
)

# Criar uma entrada em PlanoSaude
plano_saude = PlanoSaude.create!(
  nome_plano: "Plano Saúde Exemplo",
  endereco: "Avenida Saúde, 456",
  telefone: "(11) 2345-6789",
  email: "contato@planosaude.com",
  responsavel_plano: "Sr. José"
)

# Criar uma entrada em Escola
escola = Escola.create!(
  nome_escola: "Escola Inclusiva",
  endereco: "Rua Escolar, 789",
  telefone: "(11) 3456-7890",
  email: "contato@escolainclusiva.com",
  responsavel_escola: "Prof. Maria"
)

# Criar uma entrada em Clinica
clinica = Clinica.create!(
  nome_clinica: "Clínica Terapêutica",
  endereco: "Rua Terapia, 321",
  telefone: "(11) 4567-8901",
  email: "contato@clinicaterapeutica.com",
  responsavel_clinica: "Dra. Ana"
)

# Criar uma entrada em Beneficiario
beneficiario = Beneficiario.create!(
  nome: "João Silva",
  data_nascimento: "2010-01-01",
  diagnostico: "Transtorno do Espectro Autista",
  responsavel_principal: "Pai: Sr. Silva",
  contato_responsavel: "(11) 6789-0123",
  data_entrada: "2024-01-01",
  status: "Ativo",
  escola_id: escola.id,
  plano_saude_id: plano_saude.id
)

# Criar uma entrada em BeneficiariosClinica
BeneficiariosClinica.create!(
  beneficiarios_id: beneficiario.id,
  clinicas_id: clinica.id,
  data_inicio: "2024-01-15",
  data_fim: "2024-06-15"
)

# Criar uma entrada em Avaliacao
Avaliacao.create!(
  beneficiario_id: beneficiario.id,
  data_avaliacao: "2024-02-01",
  tipo_avaliacao: "Psicológica",
  resultado_avaliacao: "Melhora observada em interação social",
  detalhes: "Detalhes da avaliação psicológica"
)

# Criar uma entrada em PlanoTerapeutico
plano_terapeutico = PlanoTerapeutico.create!(
  beneficiario_id: beneficiario.id,
  data_inicio: "2024-01-20",
  data_fim: "2024-12-20",
  objetivos: "Desenvolvimento social e comunicação",
  descricao: "Plano focado em habilidades sociais",
  carga_horaria: 20,
  status: "Em andamento"
)

# Criar uma entrada em Profissional
profissional = Profissional.create!(
  nome: "Dra. Clara",
  funcao: "Terapeuta Ocupacional",
  especialidade: "Terapia Ocupacional",
  contato: "(11) 7890-1234",
  disponibilidade: "Terça e Quinta",
  clinica_id: clinica.id,
  email: "draclara@clinicaterapeutica.com",
  password_digest: BCrypt::Password.create("password123")
)

# Criar uma entrada em SessaoTerapeutica
SessaoTerapeutica.create!(
  plano_terapeuticos_id: plano_terapeutico.id,
  profissional_id: profissional.id,
  clinica_id: clinica.id,
  data_sessao: "2024-02-10 14:00:00",
  descricao: "Sessão de terapia ocupacional focada em habilidades motoras",
  observacoes: "Beneficiário mostrou boa interação"
)

# Criar uma entrada em Auditoria
Auditoria.create!(
  beneficiario_id: beneficiario.id,
  supervisor_id: supervisor.id,
  data_auditoria: "2024-03-01",
  detalhes: "Revisão geral do plano terapêutico",
  conclusao: "Aprovado com recomendações",
  proxima_auditoria: "2024-06-01"
)

# Criar uma entrada em ReuniaoFamiliar
ReuniaoFamiliar.create!(
  beneficiario_id: beneficiario.id,
  supervisor_id: supervisor.id,
  data_reuniao: "2024-02-15 10:00:00",
  descricao: "Reunião para discutir progresso do beneficiário",
  feedback_familiar: "Família satisfeita com o progresso"
)

# Criar uma entrada em FeedbackEscola
FeedbackEscola.create!(
  beneficiario_id: beneficiario.id,
  supervisor_id: supervisor.id,
  data_feedback: "2024-02-20",
  observacoes: "Beneficiário mostrou progresso nas habilidades sociais",
  status_acompanhamento: "Monitorando"
)

puts "Dados de exemplo criados com sucesso!"
