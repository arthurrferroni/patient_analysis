module Api
  module V1
    # BaseController é a classe base para todos os controladores da API V1
    class BaseController < ApplicationController
      # Executa o método authenticate_request antes de qualquer ação
      before_action :authenticate_request
      
      private
      
      # Método para autenticar a requisição
      def authenticate_request
        # Obtém o token do cabeçalho 'Authorization'
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
          # Decodifica o token JWT
          @decoded = JsonWebToken.decode(header)
          # Encontra o usuário atual com base no token decodificado
          @current_user = find_current_user
        rescue ActiveRecord::RecordNotFound => e
          # Retorna erro 401 se o usuário não for encontrado
          render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
          # Retorna erro 401 se houver erro na decodificação do token
          render json: { errors: e.message }, status: :unauthorized
        end
      end
      
      # Método para encontrar o usuário atual com base no token decodificado
      def find_current_user
        if @decoded[:supervisor_id]
          # Retorna o Supervisor se o token contiver supervisor_id
          Supervisor.find(@decoded[:supervisor_id])
        elsif @decoded[:profissional_id]
          # Retorna o Profissional se o token contiver profissional_id
          Profissional.find(@decoded[:profissional_id])
        else
          # Lança um erro se o token não contiver nenhum ID válido
          raise JWT::DecodeError
        end
      end
    end
  end
end