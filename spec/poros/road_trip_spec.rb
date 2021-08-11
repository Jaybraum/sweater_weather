require 'rails_helper'

RSpec.describe RoadTrip do
  describe '#initialize' do
    it 'encapsulates road trip data into object', :vcr do
      details = WeatherFacade.road_trip('Brooklyn,NY', 'Miami, FL')

      expect(details).to be_an(RoadTrip)

      expect(details.origin).to be_an(String)
      expect(details.destination).to be_an(String)
      expect(details.conditions).to be_an(String)
      expect(details.temperature).to be_an(Float)
      expect(details.travel_time).to be_an(String)
    end
  end
end
