require 'rails_helper'

RSpec.describe UnsplashService do
  describe 'class methods' do
      describe '::get_picture_details' do
        it 'returns picture data', :vcr do
          response = UnsplashService.get_photo_details("Brooklyn,NY")

          expect(response).to be_a(Hash)
          expect(response[:results]).to be_an(Array)

          brooklyn = response[:results][0]

          expect(brooklyn).to be_a(Hash)
          expect(brooklyn[:id]).to be_an(String)
          expect(brooklyn[:description]).to be_an(String)

          expect(brooklyn[:urls]).to be_an(Hash)
          expect(brooklyn[:urls][:regular]).to be_an(String)
      end
    end
  end
end
