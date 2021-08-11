require 'rails_helper'

RSpec.describe DirectionService do
  describe 'class methods' do
      describe '::get_direction_details' do
        it 'returns direction data', :vcr do
          response = DirectionService.get_direction_details("Brooklyn,NY", "Manhattan, NY")

          expect(response).to be_a(Hash)
          expect(response[:route]).to be_an(Hash)
      end
    end
  end
end
