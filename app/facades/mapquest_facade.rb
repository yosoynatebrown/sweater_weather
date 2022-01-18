# frozen_string_literal: true

class MapquestFacade
  def self.coordinates(city)
    response = MapquestService.coordinates(city)

    coordinates = response[:results][0][:locations][0][:latLng]

    Coordinate.new(coordinates)
  end

  def self.directions(from, to)
    directions = MapquestService.directions(from, to)[:route]

    Direction.new(directions)
  end
end
