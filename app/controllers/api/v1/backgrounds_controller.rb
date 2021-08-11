class Api::V1::BackgroundsController < ApplicationController

  def index
    @image = WeatherFacade.retrieve_image(params[:location])
    render json: ImageSerializer.details(@image, params[:location])
  end
end
