class DirectionService
  def self.get_direction_details(origin, destination)
    response = conn.get("route?from=#{origin}&to=#{destination}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url:'http://www.mapquestapi.com/directions/v2/') do |req|
      req.params['key'] = ENV['GEO_KEY']
    end
  end

  private_class_method :conn
end
