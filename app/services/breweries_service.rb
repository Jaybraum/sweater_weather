class BreweriesService
  def self.get_brewery_details(latitude, longitude)
    response = conn.get("breweries?by_dist=#{latitude},#{longitude}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.openbrewerydb.org/breweries?') do |req|
      req.params['appid'] = ENV['FORECAST_KEY']
    end
  end

  private_class_method :conn
end
