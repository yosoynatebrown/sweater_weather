class Forecast
  attr_reader :id,
              :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(time_scales)
    @id              = nil
    @current_weather = current(time_scales[:current_weather])
    @hourly_weather  = hourly(time_scales[:hourly_weather])
    @daily_weather   = daily(time_scales[:daily_weather])
  end

  def current(data)
    {
      datetime: Time.at(data[:dt]),
      sunrise: Time.at(data[:sunrise]),
      sunset: Time.at(data[:sunset]),
      temperature: data[:temp].to_f,
      feels_like: data[:feels_like].to_f,
      humidity: data[:humidity],
      uvi: data[:uvi],
      visibility: data[:visibility],
      conditions: data[:weather][0][:description],
      icon: data[:weather][0][:icon]
    }
  end

  def daily(data)
    data.map do |day|
      {
        date: Time.at(day[:dt]).strftime("%F"),
        sunrise: Time.at(day[:sunrise]),
        sunset: Time.at(day[:sunset]),
        max_temp: day[:temp][:max].to_f,
        min_temp: day[:temp][:min].to_f,
        conditions: day[:weather][0][:description],
        icon: day[:weather][0][:icon]
      }
    end
  end

  def hourly(data)
    data.map do |hour|
      {
        time: Time.at(hour[:dt]).strftime("%T")  ,
        temperature: hour[:temp].to_f,
        conditions: hour[:weather][0][:description],
        icon: hour[:weather][0][:icon]
      }
    end
  end
end