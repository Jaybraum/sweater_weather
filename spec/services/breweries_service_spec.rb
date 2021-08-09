require 'rails_helper'

RSpec.describe BreweriesService do
  describe 'class methods' do
      describe '::get_brewery_details' do
        it 'returns brewert data', :vcr do
          response = BreweriesService.get_brewery_details(40.692529, -73.990996)

          expect(response).to be_a(Hash)
          expect(response[:current]).to be_an(Hash)
          require "pry"; binding.pry

          current = response[:current]
      end
    end
  end
end
