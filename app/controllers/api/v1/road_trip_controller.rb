class Api::V1::RoadTripController < ApplicationController
  def create
    road_trip = RoadTripFacade.road_trip(params[:origin], params[:destination])

    render json: RoadTripSerializer.new(road_trip)
  end
end