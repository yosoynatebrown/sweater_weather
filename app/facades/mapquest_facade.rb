class MapquestFacade
  def self.coordinates(city)
    response = MapquestService.coordinates(city)

    coordinates = response[:results][0][:locations][0][:latLng]

    Coordinate.new(coordinates)
  end
end