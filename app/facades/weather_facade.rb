class WeatherFacade
  def self.retrieve_coordinates(location)
    results = LocationService.get_location_details(location)[:results][0][:locations]
    results.map do |coordinate|
      Coordinate.new(coordinate)
    end
  end

  def self.retrieve_image(location)
    results = UnsplashService.get_photo_details(location)[:results]
    results.map do |image|
      Image.new(image)
    end
  end

  def self.road_trip(origin, destination)
    route_time = DirectionService.get_direction_details(origin, destination)[:route][:formattedTime]
    coordinates = WeatherFacade.retrieve_coordinates(destination)
    forecast = ForecastService.get_forecast_details(coordinates.first.lat, coordinates.first.lng)[:hourly]
    weather_hour = hourly_forecast(forecast)[route_time.to_i]
    trip_data = {
      origin: origin,
      destination: destination,
      travel_time: route_time,
      weather_eta: weather_hour,
    }
    RoadTrip.new(trip_data)
  end

  def self.full_forecast(location)
    coordinates = WeatherFacade.retrieve_coordinates(location)
    forecast = ForecastService.get_forecast_details(coordinates.first.lat, coordinates.first.lng)
    forecast_data = {
      current: current_forecast(forecast[:current]),
      daily: daily_forecast(forecast[:daily]),
      hourly: hourly_forecast(forecast[:hourly][0..7])
    }
    Forecast.new(forecast_data)
  end

  def self.current_forecast(forecast_data)
    Current.new(forecast_data)
  end

  def self.daily_forecast(forecast_data)
    forecast_data[0..4].map do |data|
      Daily.new(data)
    end
  end

  def self.hourly_forecast(forecast_data)
    forecast_data.map do |data|
      Hourly.new(data)
    end
  end
end
