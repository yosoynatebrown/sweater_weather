require 'rails_helper'

RSpec.describe 'Mapquest Facade' do
  it '.coordinates', :vcr do
    coordinate = MapquestFacade.coordinates("Denver, CO")
    
    expect(coordinate).to be_a Coordinate
  end
end