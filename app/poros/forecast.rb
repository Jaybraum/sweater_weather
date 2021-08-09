class Forecast
  attr_reader :current, :daily, :hourly

  def initialize(forecast)
    @current = forecast[:current]
    @daily = forecast[:daily]
    @hourly = forecast[:hourly]
  end
end
