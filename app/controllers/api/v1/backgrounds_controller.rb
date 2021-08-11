class Api::V1::BackgroundsController < ApplicationController

  def index
    image = WeatherFacade.retrieve_image(params[:location])

    if params[:location].blank?
      render json: { error: 'Location Missing' }, status: 400
    else
      render json: ImageSerializer.details(image, params[:location])
    end
  end
end
