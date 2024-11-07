module Api
  module V1
    # AuthController é responsável por gerenciar a autenticação dos usuários
    class AuthController < ApplicationController
      # Método para realizar o login
      def login
        # Verifica o tipo de usuário (supervisor ou profissional) e busca pelo email
        if login_params[:tipo] == 'supervisor'
          user = Supervisor.find_by_email(login_params[:email])
        else
          user = Profissional.find_by_email(login_params[:email])
        end
        
        # Autentica o usuário e gera o token JWT se as credenciais estiverem corretas
        if user&.authenticate(login_params[:password])
          token = JsonWebToken.encode(user_type: login_params[:tipo], 
                                    "#{login_params[:tipo]}_id": user.id)
          # Retorna o token e os dados do usuário (exceto a senha)
          render json: { token: token, user: user.as_json(except: :password_digest) }
        else
          # Retorna erro 401 se as credenciais estiverem incorretas
          render json: { error: 'unauthorized' }, status: :unauthorized
        end
      end
      
      private
      
      # Método para permitir apenas os parâmetros necessários para o login
      def login_params
        params.require(:auth).permit(:email, :password, :tipo)
      end
    end
  end
end