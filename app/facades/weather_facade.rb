class WeatherFacade
  def self.forecast(coordinates)
    response = WeatherService.forecast(coordinates.latitude, coordinates.longitude)

    time_scales = {
      current_weather: response[:current],
      hourly_weather: response[:hourly].first(8),
      daily_weather: response[:daily]
    }

    Forecast.new(time_scales)
  end
end
