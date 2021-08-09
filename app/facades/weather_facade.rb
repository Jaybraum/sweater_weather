class WeatherFacade
  def self.retrieve_coordinates(location)
    results = LocationService.get_location_details(location)[:results][0][:locations]
    results.map do |coordinate|
      Coordinate.new(coordinate)
    end
  end

  # def self.get_forecast_details(latitude, longitude)
  #   results = ForecastService.get_forecast_details(latitude, longitude)
  #   results.map do |weather|
  #     Forecast.new(weather)
  #   end
  # end

  def self.full_forecast(location)
    coordinates = WeatherFacade.retrieve_coordinates(location)
    forecast = ForecastService.get_forecast_details(coordinates.first.lat, coordinates.first.lng)
    forecast_data = {
      current: current_forecast(forecast[:current]),
      daily: daily_forecast(forecast[:daily]),
      hourly: hourly_forecast(forecast[:hourly])
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
    forecast_data[0..7].map do |data|
      Hourly.new(data)
    end
  end
end
