require 'rails_helper'

RSpec.describe LocationService do
  describe 'class methods' do
      describe '::get_location_details' do
        it 'returns location data', :vcr do
          response = LocationService.get_location_details("Brooklyn,NY")

          expect(response).to be_a Hash
          expect(response[:results]).to be_an Array
          
          brooklyn = response[:results][0][:locations][0]

          expect(brooklyn[:latLng]).to be_a Hash
          expect(brooklyn[:latLng].count).to eq(2)

          expect(brooklyn[:latLng][:lat]).to be_a(Float)
          expect(brooklyn[:latLng][:lng]).to be_a(Float)

          expect(brooklyn[:latLng][:lat]).to eq(40.692529)
          expect(brooklyn[:latLng][:lng]).to eq(-73.990996)
      end
    end
  end
end
