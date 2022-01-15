require 'rails_helper'

describe 'Forecasts API' do
  it 'sends a forecast' do
    get '/api/v1/forecast?location=denver,co'
    
    expect(response).to be_successful
    
    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to have_key(:data)
    expect(forecast[:data][:type]).to eq("forecast")
    expect(forecast[:data]).to have_key(:attributes)

    expect(forecast[:data][:attributes]).to have_key(:current_weather)
    expect(forecast[:data][:attributes]).to have_key(:hourly_weather)
    expect(forecast[:data][:attributes]).to have_key(:daily_weather)

    expect(forecast[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(forecast[:data][:attributes][:current_weather][:datetime]).to be_a String

    expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(forecast[:data][:attributes][:current_weather][:sunrise]).to be_a String

    expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(forecast[:data][:attributes][:current_weather][:sunset]).to be_a String

    expect(forecast[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(forecast[:data][:attributes][:current_weather][:temperature]).to be_a Float

    expect(forecast[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(forecast[:data][:attributes][:current_weather][:feels_like]).to be_a Float

    expect(forecast[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(forecast[:data][:attributes][:current_weather][:humidity]).to be_a(Float).or be_an Integer

    expect(forecast[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(forecast[:data][:attributes][:current_weather][:uvi]).to be_a Float

    expect(forecast[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(forecast[:data][:attributes][:current_weather][:visibility]).to be_a Integer

    expect(forecast[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:current_weather][:conditions]).to be_a String

    expect(forecast[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(forecast[:data][:attributes][:current_weather][:icon]).to be_a String

    expect(forecast[:data][:attributes][:current_weather]).not_to have_key(:wind_speed)
    expect(forecast[:data][:attributes][:current_weather]).not_to have_key(:wind_deg)
    expect(forecast[:data][:attributes][:current_weather]).not_to have_key(:wind_gust)
    expect(forecast[:data][:attributes][:current_weather]).not_to have_key(:dew_point)

    expect(forecast[:data][:attributes][:hourly_weather].length).to eq(8)

    forecast[:data][:attributes][:hourly_weather].each do |hour|
      expect(hour).to have_key(:time)
      expect(hour[:time]).to be_a(String)

      expect(hour).to have_key(:temperature)
      expect(hour[:temperature]).to be_a(Float)

      expect(hour).to have_key(:conditions)
      expect(hour[:conditions]).to be_a(String)

      expect(hour).to have_key(:icon)
      expect(hour[:icon]).to be_a(String)

      expect(hour).not_to have_key(:wind_speed)
      expect(hour).not_to have_key(:wind_deg)
      expect(hour).not_to have_key(:wind_gust)
      expect(hour).not_to have_key(:dew_point)
    end

    forecast[:data][:attributes][:daily_weather].each do |day|
      expect(day).to have_key(:date)
      expect(day[:date]).to be_a(String)

      expect(day).to have_key(:sunrise)
      expect(day[:sunrise]).to be_a(String)

      expect(day).to have_key(:sunset)
      expect(day[:sunset]).to be_a(String)

      expect(day).to have_key(:max_temp)
      expect(day[:max_temp]).to be_a(Float)

      expect(day).to have_key(:min_temp)
      expect(day[:min_temp]).to be_a(Float)

      expect(day).to have_key(:conditions)
      expect(day[:conditions]).to be_a(String)

      expect(day).to have_key(:icon)
      expect(day[:icon]).to be_a(String)
      
      expect(day).not_to have_key(:wind_speed)
      expect(day).not_to have_key(:wind_deg)
      expect(day).not_to have_key(:wind_gust)
      expect(day).not_to have_key(:dew_point)
    end
  end
end