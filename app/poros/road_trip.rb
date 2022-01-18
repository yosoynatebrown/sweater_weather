# frozen_string_literal: true

class RoadTrip
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(start_city, end_city, travel_time)
    @id             = nil
    @start_city     = start_city
    @end_city       = end_city
    @travel_time    = travel_time
    @weather_at_eta = weather_data
  end

  private

  def weather_data
    if @travel_time.nil?
      @travel_time = 'impossible'
      {}
    else
      find_weather
    end
  end

  def find_weather
    coordinates = MapquestFacade.coordinates(@end_city)
    forecast = WeatherFacade.forecast(coordinates)

    travel_time_in_seconds = to_seconds(travel_time)

    weather = if travel_time_in_seconds < 8.hours
                hourly_weather(forecast, travel_time_in_seconds)
              else
                daily_weather(forecast, travel_time_in_seconds)
              end
    arrival_weather = {}
    arrival_weather[:temperature] = weather[:temperature]
    arrival_weather[:conditions]  = weather[:conditions]
    arrival_weather
  end

  def hourly_weather(forecast, travel_time_in_seconds)
    arrival_time = Time.now + travel_time_in_seconds

    forecast.hourly_weather.each do |hourly_forecast|
      forecast_time = DateTime.parse(hourly_forecast[:time])
      return hourly_forecast if hour_of(arrival_time) == hour_of(forecast_time)
    end
  end

  def daily_weather(forecast, travel_time_in_seconds)
    arrival_time = Time.now + travel_time_in_seconds

    forecast.daily_weather.each do |daily_forecast|
      forecast_time = DateTime.parse(daily_forecast[:date])
      return daily_forecast if day_of(arrival_time) == day_of(forecast_time)
    end
  end

  def hour_of(time)
    time.strftime('%H').to_i
  end

  def day_of(time)
    time.strftime('%d').to_i
  end

  def to_seconds(_time)
    time_scales = travel_time.split(':').map(&:to_i)
    time_scales[0] * 3600 + time_scales[1] * 60 + time_scales[2]
  end
end
