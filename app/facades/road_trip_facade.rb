class RoadTripFacade
  def self.road_trip(start_city, end_city)
    directions = MapquestFacade.directions(start_city, end_city)
    travel_time = directions.travel_time
    
    RoadTrip.new(start_city, end_city, travel_time)
  end
end