class ForecastService
  def self.get_forecast_details(latitude, longitude)
    response = conn.get("onecall?lat=#{latitude}&lon=#{longitude}&exclude=minutely,alerts")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org/data/2.5/') do |req|
      req.params['appid'] = ENV['FORECAST_KEY']
    end
  end

  private_class_method :conn
end
