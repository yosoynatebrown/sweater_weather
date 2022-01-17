class Api::V1::ForecastController < ApplicationController
  def index
    coordinates = MapquestFacade.coordinates(params[:location])
    forecast = WeatherFacade.forecast(coordinates)

    render json: ForecastSerializer.new(forecast)
  end
end
