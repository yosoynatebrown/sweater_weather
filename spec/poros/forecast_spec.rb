# frozen_string_literal: true

require 'rails_helper'

describe Forecast do
  let(:forecast) { Forecast.new(forecast_data) }
  it 'has attributes' do
    expect(forecast.current_weather).to be_a Hash
    expect(forecast.hourly_weather).to be_a Array
    expect(forecast.daily_weather).to be_a Array
  end

  it 'has current weather' do
    expect(forecast.current_weather[:datetime]).to eq('2022-01-15 14:16:43 -0700'.to_datetime)
    expect(forecast.current_weather[:sunrise]).to eq('2022-01-15 07:19:04 -0700'.to_datetime)
    expect(forecast.current_weather[:sunset]).to eq('2022-01-15 16:59:18 -0700'.to_datetime)
    expect(forecast.current_weather[:temperature]).to eq(46.6)
    expect(forecast.current_weather[:feels_like]).to eq(44.94)
    expect(forecast.current_weather[:humidity]).to eq(44)
    expect(forecast.current_weather[:uvi]).to eq(1.35)
    expect(forecast.current_weather[:visibility]).to eq(10_000)
    expect(forecast.current_weather[:conditions]).to eq('clear sky')
    expect(forecast.current_weather[:icon]).to eq('01d')
  end

  it 'has hourly weather' do
    expect(forecast.hourly_weather[0][:time]).to eq('14:00:00')
    expect(forecast.hourly_weather[0][:temperature]).to eq(46.6)
    expect(forecast.hourly_weather[0][:conditions]).to eq('clear sky')
    expect(forecast.hourly_weather[0][:icon]).to eq('01d')
  end

  it 'has daily weather' do
    expect(forecast.daily_weather[0][:date]).to eq('2022-01-15')
    expect(forecast.daily_weather[0][:sunrise]).to eq('2022-01-15 07:19:04 -0700'.to_datetime)
    expect(forecast.daily_weather[0][:sunset]).to eq('2022-01-15 16:59:18 -0700'.to_datetime)
    expect(forecast.daily_weather[0][:max_temp]).to eq(46.6)
    expect(forecast.daily_weather[0][:min_temp]).to eq(25.16)
    expect(forecast.daily_weather[0][:conditions]).to eq('clear sky')
    expect(forecast.daily_weather[0][:icon]).to eq('01d')
  end
end
