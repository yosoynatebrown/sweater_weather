require 'rails_helper'

RSpec.describe 'Weather Facade' do
  it '.coordinates', :vcr do
    coordinates = Coordinate.new({:lat=>39.738453, :lng=>-104.984853})

    forecast = WeatherFacade.forecast(coordinates)
    
    expect(forecast).to be_a Forecast
  end
end