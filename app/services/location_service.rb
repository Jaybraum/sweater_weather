class LocationService
  def self.get_location_details(location)
    response = conn.get("address?location=#{location}&maxResults=1")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com/geocoding/v1/') do |req|
      req.params['key'] = ENV['GEO_KEY']
    end
  end

  private_class_method :conn
end
