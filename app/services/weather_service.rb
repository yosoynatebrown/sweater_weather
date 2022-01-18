# frozen_string_literal: true

class WeatherService
  def self.forecast(lat, lng, units = 'imperial')
    conn = get_url(url: 'https://api.openweathermap.org')

    response = conn.post("/data/2.5/onecall?lat=#{lat}&lon=#{lng}&units=#{units}&appid=#{ENV['open_weather_key']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_url(url)
    Faraday.new(url)
  end
end
