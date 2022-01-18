# frozen_string_literal: true

module Api
  module V1
    class ForecastController < ApplicationController
      def index
        coordinates = MapquestFacade.coordinates(params[:location])
        forecast = WeatherFacade.forecast(coordinates)

        render json: ForecastSerializer.new(forecast)
      end
    end
  end
end
