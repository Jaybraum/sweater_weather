require 'rails_helper'

RSpec.describe 'Breweries API' do
  describe 'GET /breweries' do
    it "Returns breweries data formatted", :vcr do
      get '/api/v1/breweries', params: {location: 'Brooklyn,NY', quantity: 5}

      expect(response).to have_http_status 200

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to be_a Hash
      expect(response_body[:data]).to be_a Hash

      breweries = response_body[:data]
      expect(breweries[:id]).to eq nil
      expect(breweries[:type]).to eq 'breweries'
      expect(breweries[:attributes]).to be_a Hash

      current_breweries = breweries[:attributes][:current_weather]
      daily_breweries = breweries[:attributes][:daily_weather]
      hourly_breweries = breweries[:attributes][:hourly_weather]
    end
  end
end
