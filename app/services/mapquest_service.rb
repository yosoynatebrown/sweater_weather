class MapquestService
  def self.coordinates(city)
    conn = get_url(url: "http://www.mapquestapi.com")

    response = conn.get("/geocoding/v1/address?key=#{ENV['mapquest_key']}&location=#{city}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.directions(from, to)
    conn = get_url(url: "https://open.mapquestapi.com")

    response = conn.get("/directions/v2/route?key=#{ENV['mapquest_key']}&from=#{from}&to=#{to}")
    JSON.parse(response.body, symbolize_names: true)
  end

private
    def self.get_url(url)
      Faraday.new(url)
    end
end