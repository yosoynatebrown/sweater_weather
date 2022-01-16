class Api::V1::RoadTripController < ApplicationController
  def create
    RoadTripFacade.road_trip(params[:origin], params[:destination])

    render json: RoadtripSerializer.new(background)
  end
end