require 'rails_helper'

RSpec.describe 'Roadtrip API' do
  describe 'GET /road_trip' do
    xit "Returns road_trip data formatted", :vcr do
      post '/api/v1/road_trip', params:
      {
        origin: 'Brooklyn, NY',
        destination: 'Miami, FL',
        api_key: "b5ef74dc2166f263c6c1"
      }
      expect(response).to have_http_status(200)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to be_a(Hash)
      expect(data[:data]).to be_a(Hash)
      expect(data[:data][:id]).to eq(nil)
      expect(data[:data][:type]).to eq('roadtrip')
      expect(data[:data][:attributes]).to be_a(Hash)

      road_trip = data[:data][:attributes]
      expect(road_trip[:start_city]).to be_an(String)
      expect(road_trip[:end_city]).to be_an(String)
      expect(road_trip[:travel_time]).to be_an(String)

      expect(road_trip[:weather_at_eta]).to be_an(Hash)

      weather_at = road_trip[:weather_at_eta]
      expect(weather_at[:temperature]).to be_an(Float)
      expect(weather_at[:conditions]).to be_an(String)
    end

    xit 'Returns impossible response', :vcr do
      post '/api/v1/road_trip', params:
      {
        origin: 'Brooklyn, NY',
        destination: 'Amsterdam, NL',
        api_key: "b5ef74dc2166f263c6c1"
      }

      expect(response).to have_http_status(200)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to be_a(Hash)
      expect(data[:data]).to be_a(Hash)
      expect(data[:data][:id]).to eq(nil)
      expect(data[:data][:type]).to eq('roadtrip')
      expect(data[:data][:attributes]).to be_a(Hash)

      road_trip = data[:data][:attributes]
      expect(road_trip[:start_city]).to be_an(String)
      expect(road_trip[:end_city]).to be_an(String)
      expect(road_trip[:travel_time]).to eq("Impossible")

      expect(road_trip[:weather_at_eta]).to be_an(Hash)

      weather_at = road_trip[:weather_at_eta]
      expect(weather_at[:temperature]).to eq(nil)
      expect(weather_at[:conditions]).to eq(nil)
    end

    it 'Returns an error message', :vcr do
      post '/api/v1/road_trip', params:
      {
        origin: 'Brooklyn, NY',
        destination: 'Miami, FL',
        api_key: " "
      }

      expect(response).to have_http_status(403)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to eq({error: 'The Api Key submitted with this request is invalid.'})
    end
  end
end
