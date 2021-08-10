require 'rails_helper'

RSpec.describe 'Forecast API' do
  describe 'GET /forecast' do
    it "Returns forecast data formatted", :vcr do
      get '/api/v1/forecast', params: {location: 'Brooklyn,NY'}

      expect(response).to have_http_status(200)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to be_a Hash
      expect(data[:data]).to be_a Hash
      expect(data[:data][:id]).to eq(nil)
      expect(data[:data][:type]).to eq('forecast')
      expect(data[:data][:attributes]).to be_a(Hash)

      current_forecast = data[:data][:attributes][:current_weather]
      expect(current_forecast[:datetime]).to be_an(String)
      expect(current_forecast[:sunrise]).to be_an(String)
      expect(current_forecast[:sunset]).to be_an(String)
      expect(current_forecast[:temperature]).to be_an(Float)
      expect(current_forecast[:feels_like]).to be_an(Float)
      expect(current_forecast[:humidity]).to be_an(Integer)
      expect(current_forecast[:uvi]).to be_an(Float)
      expect(current_forecast[:visibility]).to be_an(Integer)
      expect(current_forecast[:conditions]).to be_an(String)
      expect(current_forecast[:icon]).to be_an(String)

      daily_forecast = data[:data][:attributes][:daily_weather]
      expect(daily_forecast.count).to eq(5)
      expect(daily_forecast[0][0][:date]).to be_an(String)
      expect(daily_forecast[0][0][:sunrise]).to be_an(String)
      expect(daily_forecast[0][0][:sunset]).to be_an(String)
      expect(daily_forecast[0][0][:max_temp]).to be_an(Float)
      expect(daily_forecast[0][0][:min_temp]).to be_an(Float)

      hourly_forecast = data[:data][:attributes][:hourly_weather]
      expect(hourly_forecast.count).to eq(8)
      expect(hourly_forecast[0][0][:time]).to be_an(String)
      expect(hourly_forecast[0][0][:temperature]).to be_an(Float)
      expect(hourly_forecast[0][0][:conditions]).to be_an(String)
      expect(hourly_forecast[0][0][:icon]).to be_an(String)
    end
  end
end
