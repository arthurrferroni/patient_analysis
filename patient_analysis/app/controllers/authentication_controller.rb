class AuthenticationController < ApplicationController
  def login
    user_params = params.require(:authentication).permit(:email, :password)
    @user = User.find_by_email(user_params[:email])
    if @user&.authenticate(user_params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      render json: { token: token, user_id: @user.id }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end