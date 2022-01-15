class WeatherService
  def self.weather(lat, lng)
    conn = get_url(url: "https://api.openweathermap.org")

    response = conn.post("/data/2.5/onecall?lat=#{lat}&lon=#{lng}&appid=#{ENV['open_weather_key']}")
    JSON.parse(response.body, symbolize_names: true)
  end

private
    def self.get_url(url)
      Faraday.new(url)
    end
end