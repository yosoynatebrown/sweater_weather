# frozen_string_literal: true

class Coordinate
  attr_reader :latitude,
              :longitude

  def initialize(data)
    @latitude  = data[:lat]
    @longitude = data[:lng]
  end
end
