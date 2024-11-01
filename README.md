# PatientAnalysis

Bem-vindo ao **PatientAnalysis**, uma aplicação web para gerenciamento e análise de pacientes, com foco em auxiliar profissionais de saúde no diagnóstico e acompanhamento de pacientes com transtorno do espectro autista (TEA).

## Sumário

- [Descrição](#descrição)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)
- [Configuração](#configuração)
- [Execução](#execução)
- [Testes](#testes)
- [Contribuição](#contribuição)
- [Licença](#licença)
- [Contato](#contato)

## Descrição

O **PatientAnalysis** é uma aplicação construída em Ruby on Rails que permite:

- Gerenciar pacientes (criar, editar, visualizar e excluir).
- Gerar relatórios médicos e resumos automáticos utilizando inteligência artificial.
- Processar tarefas em segundo plano com o Sidekiq.
- Interface estilizada com Tailwind CSS para uma experiência de usuário agradável.

## Tecnologias Utilizadas

- **Ruby** 3.3.3
- **Ruby on Rails** 7.x
- **PostgreSQL** para banco de dados
- **Sidekiq** para processamento em background
- **Redis** como suporte ao Sidekiq
- **Tailwind CSS** para estilização
- **Stimulus JS** para interatividade
- **Faraday** para requisições HTTP
- **faraday-retry** para middleware de retry
- **RVM** para gerenciamento de versões do Ruby

## Pré-requisitos

Antes de começar, certifique-se de ter instalado em sua máquina:

- **Ruby** 3.3.3 (gerenciado pelo RVM)
- **Ruby on Rails** 7.x
- **PostgreSQL**
- **Redis**
- **Node.js** e **Yarn** (para assets do Rails)

## Instalação

1. **Clone o repositório:**

   ```bash
   git clone https://github.com/seu-usuario/patient_analysis.git
   cd patient_analysis
   ```

   ```bash
   bundle install && yarn install
   ```
   
   * Edite ```config/database.yml``` com as configurações do banco de dados
  
   * Crie e prepare o banco de dados:
   ```bash
   rails db:create
   rails db:migrate
   ```
   * Instale o Tailwind CSS (se ainda não o fez):
   ```bash
   rails tailwindcss:install
   ```

## Configuração

1. **Variáveis de Ambiente**
Crie um arquivo .env na raiz do projeto para armazenar as variáveis de ambiente necessárias.
Exemplo de .env:

   ```bash
   GROQ_API_KEY=seu_token_api
   ```
2. Configuração do Sidekiq

  O Sidekiq utiliza o Redis para gerenciar as filas de tarefas em background.

  Certifique-se de que o Redis está instalado e em execução em sua máquina.
  A configuração padrão do Sidekiq está no arquivo ```config/sidekiq.yml.```

## Exceução
1. Execute
  ```bash
  redis-server
  bundle exec sidekiq
  rails server
  ```

2. Abra o navegador e navegue até http://localhost:3000.

## Uso
 ### Gerenciar Pacientes

  Listar Pacientes:
  
    Navegue até /patients para ver a lista de pacientes.

  Criar Novo Paciente:
  
      Clique em "Novo Paciente" para adicionar um novo paciente.
      
  Editar/Visualizar/Excluir Pacientes:
  
    Utilize as opções disponíveis na lista de pacientes.

### Gerar Relatórios e Resumos

  Adicionar Relatório a um Paciente:
  
    Ao visualizar um paciente, você pode adicionar relatórios médicos.
  
  Gerar Resumo Automático:
  
    O sistema utiliza a API do GROQ para gerar resumos dos relatórios em background, usando o Sidekiq.


Contato

  * Arthur Ferroni
  * Email: arthur@approachti.com.br
  * LinkedIn: Arthur Ferroni
