# frozen_string_literal: true

class UnsplashService
  def self.images(search)
    conn = get_url(url: 'https://api.unsplash.com')

    response = conn.get("/search/photos?query=#{search}&client_id=#{ENV['unsplash_key']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_url(url)
    Faraday.new(url)
  end
end
