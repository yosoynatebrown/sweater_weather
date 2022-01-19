# frozen_string_literal: true

class WeatherService < Service
  def self.forecast(lat, lng, units = 'imperial')
    conn = get_url(url: 'https://api.openweathermap.org')

    response = conn.post("/data/2.5/onecall?lat=#{lat}&lon=#{lng}&units=#{units}&appid=#{ENV['open_weather_key']}")
    parse_response(response)
  end
end
