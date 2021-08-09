require 'rails_helper'

RSpec.describe 'Forecast API' do
  describe 'GET /forecast' do
    it "Returns forecast data formatted", :vcr do
      get '/api/v1/forecast', params: {location: 'Brooklyn,NY'}

      expect(response).to have_http_status 200

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to be_a Hash
      expect(response_body[:data]).to be_a Hash

      forecast = response_body[:data]
      expect(forecast[:id]).to eq nil
      expect(forecast[:type]).to eq 'forecast'
      expect(forecast[:attributes]).to be_a Hash

      current_forecast = forecast[:attributes][:current_weather]
      daily_forecast = forecast[:attributes][:daily_weather]
      hourly_forecast = forecast[:attributes][:hourly_weather]
    end
  end
end
