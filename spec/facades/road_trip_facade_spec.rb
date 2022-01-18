require 'rails_helper'

RSpec.describe 'Road Trip Facade' do
  it '.road_trip', :vcr do
    road_trip = RoadTripFacade.road_trip('Denver, CO', 'Pueblo, CO')

    expect(road_trip).to be_a RoadTrip
  end
end
