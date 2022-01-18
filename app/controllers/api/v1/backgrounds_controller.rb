# frozen_string_literal: true

module Api
  module V1
    class BackgroundsController < ApplicationController
      def index
        background = UnsplashFacade.image(params[:location])

        render json: ImageSerializer.new(background)
      end
    end
  end
end
