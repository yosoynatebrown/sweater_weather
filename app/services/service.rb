class Service
  private
  def self.parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
  def self.get_url(url)
    Faraday.new(url)
  end
end