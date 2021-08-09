class BreweriesFacade
  def self.get_breweries_data(location)
    coordinates = WeatherFacade.retrieve_coordinates(location)
    weather = WeatherFacade.full_forecast(location)
    brew_data = BreweriesService.get_brewery_details(coordinates.first.lat, coordinates.first.lng)
    brew_data.map do |data|
      Breweries.new(data)
    end
    brew_data = [weather, brew_data]
  end
end
