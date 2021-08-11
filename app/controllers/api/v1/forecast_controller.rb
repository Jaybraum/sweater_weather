class Api::V1::ForecastController < ApplicationController

  def index
    @forecast = WeatherFacade.full_forecast(params[:location])
    render json: ForecastSerializer.details(@forecast)
  end
end
