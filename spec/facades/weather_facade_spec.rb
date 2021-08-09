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
  end
end
