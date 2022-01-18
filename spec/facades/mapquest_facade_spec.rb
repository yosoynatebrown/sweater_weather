require 'rails_helper'

RSpec.describe 'Mapquest Facade' do
  it '.coordinates', :vcr do
    coordinate = MapquestFacade.coordinates('Denver, CO')

    expect(coordinate).to be_a Coordinate
  end
  it '.directions', :vcr do
    directions = MapquestFacade.directions('Denver, CO', 'Los Angeles, CA')

    expect(directions).to be_a Direction
  end
end
