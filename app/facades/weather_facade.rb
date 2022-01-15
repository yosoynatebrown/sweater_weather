class WeatherFacade
  def self.forecast(lat, lng)
    response = WeatherService.forecast(lat, lng)
    
    time_scales = {
      current_weather: response[:current],
      hourly_weather:  response[:hourly],
      daily_weather:   response[:daily]
    }

    Forecast.new(time_scales)
  end
end