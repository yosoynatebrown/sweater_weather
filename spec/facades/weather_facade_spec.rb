require 'rails_helper'

RSpec.describe 'Weather Facade' do
  it '.coordinates' do
    forecast = WeatherFacade.forecast(39.738453, -104.984853)
    
    expect(forecast).to be_a Forecast
  end
end