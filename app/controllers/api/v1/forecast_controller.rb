# frozen_string_literal: true

module Api
  module V1
    class ForecastController < ApplicationController
      def index
        coordinates = MapquestFacade.coordinates(params[:location])
        if params[:units]
          forecast = WeatherFacade.forecast(coordinates, params[:units])
        else
          forecast = WeatherFacade.forecast(coordinates)
        end
        render json: ForecastSerializer.new(forecast)
      end
    end
  end
end
