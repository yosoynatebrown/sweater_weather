class RoadTripFacade
  def self.road_trip(start_city, end_city)
    direction = MapquestFacade.directions(start_city, end_city)
    travel_time = direction.travel_time

    road_trip = RoadTrip.new(start_city, end_city, travel_time)
    require 'pry'; binding.pry
  end
end