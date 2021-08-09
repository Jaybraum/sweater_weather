class WeatherFacade
  def self.retrieve_coordinates(location)
    results = LocationService.get_location_details(location)[:results][0][:locations]
    results.map do |coordinate|
      Coordinate.new(coordinate)
    end
  end

  # def self.search_nearby(cocktail, location)
  #   results = YelpService.get_businesses(cocktail, location)[:businesses]
  #   results.map do |result|
  #     Business.new(result)
  #   end
  # end
end
