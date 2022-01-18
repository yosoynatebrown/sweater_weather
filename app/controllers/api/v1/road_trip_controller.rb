class Api::V1::RoadTripController < ApplicationController
  include ExceptionHandler
  def create
    User.find_by!(api_key: params[:api_key])
    road_trip = RoadTripFacade.road_trip(params[:origin], params[:destination])

    render json: RoadTripSerializer.new(road_trip)
  end
end
