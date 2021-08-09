class ForecastSerializer < ActiveModel::Serializer
  attributes :current, :daily, :hourly

  def self.details(data)
  {
    data:
    {
      id: nil,
      type: 'forecast',
      attributes: {
        current_weather: {
          datetime: data.current.datetime,
          sunrise: data.current.sunrise,
          sunset: data.current.sunset,
          temperature: data.current.temperature,
          feels_like: data.current.feels_like,
          humidity: data.current.humidity,
          uvi: data.current.uvi,
          visibility: data.current.visibility,
          conditions: data.current.conditions,
          icon: data.current.icon
        },
        daily_weather:
        data.daily.map do |daily|
          [
            {
              date: daily.date,
              sunrise: daily.sunrise,
              sunset: daily.sunset,
              max_temp: daily.max_temp,
              min_temp: daily.min_temp,
              conditions: daily.conditions,
              icon: daily.icon
            }
          ]
        end,
        hourly_weather:
        data.hourly.map do |hourly|
          [
            {
              time: hourly.time,
              temperature: hourly.temperature,
              conditions: hourly.conditions,
              icon: hourly.icon
            }
          ]
        end
      }
    }
  }.to_json
  end
end
