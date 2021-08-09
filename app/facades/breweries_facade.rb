class BreweriesFacade
  def self.get_breweries_data(location, quantity)
    coordinates = WeatherFacade.retrieve_coordinates(location)
    weather = WeatherFacade.full_forecast(location)
    brew_data = BreweriesService.get_brewery_details(coordinates.first.lat, coordinates.first.lng)
    brew_data.first(quantity.to_i).map do |data|
      Breweries.new(data)
    end
    brew_data = [weather, brew_data]
  end
end
