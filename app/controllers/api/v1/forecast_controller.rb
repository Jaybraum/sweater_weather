class Api::V1::ForecastController < ApplicationController

  def index
    if params[:location].blank?
      render json: { error: 'Location Missing' }, status: 400
    else
      forecast = WeatherFacade.full_forecast(params[:location])
      render json: ForecastSerializer.details(forecast)
    end
  end
end
