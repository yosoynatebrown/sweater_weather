require 'rails_helper'

RSpec.describe 'Weather search' do
  it 'can find the current weather of a city', :vcr do
    response = WeatherService.forecast(39.738453, -104.984853)

    expect(response).to be_a Hash

    expect(response[:current]).to be_a Hash

    current_data = response[:current]

    expect(current_data).to have_key :dt
    expect(current_data[:dt]).to be_a Integer

    expect(current_data).to have_key :sunrise
    expect(current_data[:sunrise]).to be_a Integer

    expect(current_data).to have_key :sunset
    expect(current_data[:sunset]).to be_a Integer

    expect(current_data).to have_key :temp
    expect(current_data[:temp]).to be_a Float

    expect(current_data).to have_key :feels_like
    expect(current_data[:feels_like]).to be_a Float

    expect(current_data).to have_key :humidity
    expect(current_data[:humidity]).to be_a Integer

    expect(current_data).to have_key :uvi
    expect(current_data[:uvi]).to be_a(Float).or be_an Integer

    expect(current_data).to have_key :visibility
    expect(current_data[:visibility]).to be_a Integer

    expect(current_data[:weather][0]).to have_key :description
    expect(current_data[:weather][0][:description]).to be_a String

    expect(current_data[:weather][0]).to have_key :icon
    expect(current_data[:weather][0][:icon]).to be_a String
  end

  it 'can find the daily weather of a city', :vcr do
    response = WeatherService.forecast(39.738453, -104.984853)

    expect(response).to be_a Hash

    expect(response[:daily]).to be_an Array
    expect(response[:daily][0]).to be_a Hash

    first_day_data = response[:daily][0]

    expect(first_day_data).to have_key :dt
    expect(first_day_data[:dt]).to be_a Integer

    expect(first_day_data).to have_key :sunrise
    expect(first_day_data[:sunrise]).to be_a Integer

    expect(first_day_data).to have_key :sunset
    expect(first_day_data[:sunset]).to be_a Integer
    
    expect(first_day_data).to have_key :temp
    expect(first_day_data[:temp]).to be_a Hash

    expect(first_day_data[:temp]).to have_key :min
    expect(first_day_data[:temp][:min]).to be_a Float

    expect(first_day_data[:temp]).to have_key :max
    expect(first_day_data[:temp][:max]).to be_a Float

    expect(first_day_data[:weather][0]).to have_key :description
    expect(first_day_data[:weather][0][:description]).to be_a String

    expect(first_day_data[:weather][0]).to have_key :icon
    expect(first_day_data[:weather][0][:icon]).to be_a String
  end

  it 'can find the hourly weather of a city', :vcr do
    response = WeatherService.forecast(39.738453, -104.984853)

    expect(response).to be_a Hash

    expect(response[:hourly]).to be_an Array
    expect(response[:hourly][0]).to be_a Hash

    first_hour_data = response[:hourly][0]

    expect(first_hour_data).to have_key :dt
    expect(first_hour_data[:dt]).to be_a Integer
   
    expect(first_hour_data).to have_key :temp
    expect(first_hour_data[:temp]).to be_a Float

    expect(first_hour_data[:weather][0]).to have_key :description
    expect(first_hour_data[:weather][0][:description]).to be_a String

    expect(first_hour_data[:weather][0]).to have_key :icon
    expect(first_hour_data[:weather][0][:icon]).to be_a String
  end
end