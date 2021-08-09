class Api::V1::BreweriesController < ApplicationController

  def show
    @Breweies = WeatherFacade.full_forecast(params[:location])
    render json: ForecastSerializer.details(@forecast)
  end
end
