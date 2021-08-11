class Api::V1::BackgroundsController < ApplicationController

  def index
    if params[:location].blank?
      render json: { error: 'Location Missing' }, status: 400
    else
      image = WeatherFacade.retrieve_image(params[:location])
      render json: ImageSerializer.details(image)
    end
  end
end
