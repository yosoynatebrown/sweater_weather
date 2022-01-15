class MapquestService
  def self.coordinates(city)
    conn = get_url(url: "http://www.mapquestapi.com")

    response = conn.post("/geocoding/v1/address?key=#{ENV['mapquest_key']}&location=#{city}")
    JSON.parse(response.body, symbolize_names: true)
  end

private
    def self.get_url(url)
      Faraday.new(url)
    end
end