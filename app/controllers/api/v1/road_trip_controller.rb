# frozen_string_literal: true

module Api
  module V1
    class RoadTripController < ApplicationController
      include ExceptionHandler
      def create
        User.find_by!(api_key: params[:api_key])
        if params[:units]
          road_trip = RoadTripFacade.road_trip(params[:origin], params[:destination], params[:units])
        else
          road_trip = RoadTripFacade.road_trip(params[:origin], params[:destination])
        end

        render json: RoadTripSerializer.new(road_trip)
      end
    end
  end
end
