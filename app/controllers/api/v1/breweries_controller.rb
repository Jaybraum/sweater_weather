class Api::V1::BreweriesController < ApplicationController

  def index
    @breweries = BreweriesFacade.get_breweries_data(params[:location], params[:quantity])
    render json: BreweriesSerializer.details(@breweries, params[:location])
  end
end
