class Api::V1::RoadTripController < ApplicationController

  def create
    if User.find_by(api_key: trip_params[:api_key])
      trip_data = WeatherFacade.road_trip(trip_params[:origin], trip_params[:destination])
      render json: RoadTripSerializer.details(trip_data), status: 200
    else
      render json: { error: 'The Api Key submitted with this request is invalid.' }, status: 403
    end
  end

  private

  def trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
