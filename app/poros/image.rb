# frozen_string_literal: true

class Image
  attr_reader :id,
              :image

  def initialize(search, data)
    @id    = nil
    @image = image_hash(search, data)
  end

  def image_hash(search, data)
    {
      location: search,
      image_url: data[:urls][:raw],
      credit: {
        source: 'https://unsplash.com/?utm_source=sweater_weather&utm_medium=referral',
        author: data[:user][:name],
        author_url: "https://unsplash.com/@#{data[:user][:username]}?utm_source=sweater_weather&utm_medium=referral"
      }
    }
  end
end
