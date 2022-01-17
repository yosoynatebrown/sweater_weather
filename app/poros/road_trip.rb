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

  def weather_data
    coordinates = MapquestFacade.coordinates(@end_city)
    forecast = WeatherFacade.forecast(coordinates)
    arrival_weather = {}
    begin
      travel_time_in_seconds = DateTime.parse(travel_time).seconds_since_midnight
    rescue Date::Error
      time_scales = travel_time.split(":").map(&:to_i)
      travel_time_in_seconds = time_scales[0] * 3600 + time_scales[1] * 60 + time_scales[2]
    end
    if travel_time_in_seconds < 8.hours
      weather = hourly_weather(forecast, travel_time_in_seconds)
    else
      weather = daily_weather(forecast, travel_time_in_seconds)
    end
    arrival_weather[:temperature] = weather[:temperature]
    arrival_weather[:conditions]  = weather[:conditions]
    arrival_weather
  end

  private
      def hourly_weather(forecast, travel_time_in_seconds)
        arrival_time = Time.now + travel_time_in_seconds

        forecast.hourly_weather.each do |hourly_forecast|
          forecast_time = DateTime.parse(hourly_forecast[:time])
          if hour_of(arrival_time) == hour_of(forecast_time)
            return hourly_forecast
          end
        end
      end

      def daily_weather(forecast, travel_time_in_seconds)
        arrival_time = Time.now + travel_time_in_seconds
        
        forecast.daily_weather.each do |daily_forecast|
          forecast_time = DateTime.parse(daily_forecast[:date])
          if day_of(arrival_time) == day_of(forecast_time)
            return daily_forecast
          end
        end
      end

      def hour_of(time)
        time.strftime("%H").to_i
      end

      def day_of(time)
        time.strftime("%d").to_i
      end
end