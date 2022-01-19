# frozen_string_literal: true

class UnsplashFacade
  def self.image(location)
    time = time_of_day
    weather = get_weather(location)
    search = "#{location} #{time} #{weather}"
    response = UnsplashService.images(search)

    image = response[:results][0]

    Image.new(location, image)
  end

  def self.time_of_day
    hour = hour_of(Time.now)

    case hour
    when 0..4
      "middle of the night"
    when 5..10
      "morning"
    when 11..12
      "noon"
    when 13..16
      "afternoon"
    when 17..20
      "evening"
    when 21..23
      "night"
    end
  end

private

   def self.hour_of(time)
    time.strftime('%H').to_i
   end

   def self.get_weather(location)
    coordinates = MapquestFacade.coordinates(location)
    forecast = WeatherFacade.forecast(coordinates)
    forecast.current_weather[:conditions]
   end
end
