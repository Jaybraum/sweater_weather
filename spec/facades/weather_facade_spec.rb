require 'rails_helper'

RSpec.describe WeatherFacade do
  describe 'methods' do
    it "gets coordinates", :vcr do
      details = WeatherFacade.retrieve_coordinates('Brooklyn,NY')

      expect(details).to be_an(Array)
      expect(details.first).to be_an(Coordinate)
      expect(details.first.lat).to be_an(Float)
      expect(details.first.lng).to be_a(Float)
    end

    it "gets forecast details", :vcr do
      details = WeatherFacade.get_forecast_details(40.692529, -73.990996)

      expect(details).to be_an(Array)
    end
  end
end
