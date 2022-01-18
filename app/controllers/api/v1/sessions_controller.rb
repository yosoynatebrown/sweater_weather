# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
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
  end
end
