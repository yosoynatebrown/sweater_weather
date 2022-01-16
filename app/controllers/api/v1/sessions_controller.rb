class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      render json: UsersSerializer.invalid_credentials, status: 401
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UsersSerializer.new(user)
    else
      render json: UsersSerializer.invalid_credentials, status: 401
    end
  end
end