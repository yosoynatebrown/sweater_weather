class Api::V1::UsersController < ApplicationController
  include ExceptionHandler
  def create
    user = user_params
    new_user = User.create!(user)

    render json: UsersSerializer.new(new_user), status: 201
  end

private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end