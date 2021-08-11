require 'rails_helper'

RSpec.describe 'Background API' do
  describe 'GET /backgrounds' do
    it "Returns backgrounds data formatted", :vcr do
      get '/api/v1/backgrounds', params: {location: 'Brooklyn,NY'}

      expect(response).to have_http_status(200)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to be_a(Hash)
      expect(data[:data]).to be_a(Hash)
      expect(data[:data][:id]).to eq(nil)
      expect(data[:data][:type]).to eq('image')
      expect(data[:data][:attributes]).to be_a(Hash)

      image_data = data[:data][:attributes][:image]
      expect(image_data[:location]).to be_an(String)
      expect(image_data[:image_url]).to be_an(String)
      expect(image_data[:description]).to be_an(String)

      credit_data = data[:data][:attributes][:credit]
      expect(credit_data[:source]).to eq('unsplash.com')
      expect(credit_data[:author]).to be_an(String)
    end

    it 'Returns an error message', :vcr do
      get '/api/v1/backgrounds', params: {location: ''}

      expect(response).to have_http_status(400)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to eq({error: 'Location Missing'})
    end
  end
end
