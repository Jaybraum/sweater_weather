class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])

    if user.authenticate(params[:password])
      render json: UsersSerializer.details(user), status: 200
    else
      render json: {error: 'Invalid Credentials'}, status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
