class RoadTripFacade
  def self.road_trip(start_city, end_city)
    direction = MapquestFacade.directions(start_city, end_city)
    travel_time = direction.travel_time

    RoadTrip.new(start_city, end_city, travel_time)
  end
end