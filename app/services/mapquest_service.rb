# frozen_string_literal: true

class MapquestService < Service
  def self.coordinates(city)
    conn = get_url(url: 'http://www.mapquestapi.com')

    response = conn.get("/geocoding/v1/address?key=#{ENV['mapquest_key']}&location=#{city}")
    parse_response(response)
  end

  def self.directions(from, to)
    conn = get_url(url: 'https://open.mapquestapi.com')

    response = conn.get("/directions/v2/route?key=#{ENV['mapquest_key']}&from=#{from}&to=#{to}")
    parse_response(response)
  end

end
