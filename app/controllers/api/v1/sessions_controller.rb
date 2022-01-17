class Api::V1::SessionsController < ApplicationController
  include ExceptionHandler
  def create
    user = User.find_by!(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UsersSerializer.new(user)
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end