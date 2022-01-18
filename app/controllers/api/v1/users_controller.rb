# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      include ExceptionHandler
      def create
        new_user = User.create!(user_params)

        render json: UsersSerializer.new(new_user), status: 201
      end

      private

      def user_params
        params.permit(:email, :password, :password_confirmation)
      end
    end
  end
end
