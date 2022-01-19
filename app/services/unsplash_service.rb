# frozen_string_literal: true

class UnsplashService < Service
  def self.images(search)
    conn = get_url(url: 'https://api.unsplash.com')

    response = conn.get("/search/photos?query=#{search}&client_id=#{ENV['unsplash_key']}")
    parse_response(response)
  end
end
