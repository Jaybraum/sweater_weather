class Api::V1::BreweriesController < ApplicationController

  def index
    @breweries = BreweriesFacade.get_breweries_data(params[:location])
    render json: BreweriesSerializer.details(@breweries, params[:location], params[:quantity].to_i)
  end
end
