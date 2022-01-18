# frozen_string_literal: true

require 'rails_helper'

describe RoadTrip do
  let(:road_trip) { RoadTrip.new('Fort Collins, CO', 'Denver, CO', '01:44:35') }
  it 'has attributes', :vcr do
    expect(road_trip.start_city).to eq('Fort Collins, CO')
    expect(road_trip.end_city).to eq('Denver, CO')
    expect(road_trip.travel_time).to eq('01:44:35')
    expect(road_trip.weather_at_eta).to be_a Hash
    expect(road_trip.weather_at_eta[:temperature]).to be_a Float
    expect(road_trip.weather_at_eta[:conditions]).to be_a String
  end
end
