class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    user.email = user.email.downcase
    user.api_key = SecureRandom.hex(10)

    if User.find_by(email: user[:email])
      render json: {error: "Email already in use."}, status: 400
    elsif user.save
      render json: UsersSerializer.details(user), status: 201
    else
      render json: {error: "Invalid Credentials" }, status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
