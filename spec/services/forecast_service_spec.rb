require 'rails_helper'

RSpec.describe ForecastService do
  describe 'class methods' do
      describe '::get_forecast_details' do
        it 'returns forecast data', :vcr do
          response = ForecastService.get_forecast_details(40.692529, -73.990996)

          expect(response).to be_a(Hash)
          expect(response[:current]).to be_an(Hash)

          current = response[:current]

          expect(current[:dt]).to be_a(Integer)
          expect(current[:sunrise]).to be_a(Integer)
          expect(current[:sunset]).to be_a(Integer)
          expect(current[:temp]).to be_a(Float)
          expect(current[:feels_like]).to be_a(Float)
          expect(current[:pressure]).to be_a(Integer)
          expect(current[:humidity]).to be_a(Integer)
          expect(current[:dew_point]).to be_a(Float)
          expect(current[:uvi]).to be_a(Float)
          expect(current[:clouds]).to be_a(Integer)
          expect(current[:visibility]).to be_a(Integer)
          expect(current[:wind_speed]).to be_a(Float)
          expect(current[:wind_deg]).to be_a(Integer)

          expect(response[:current][:weather]).to be_an(Array)
          weather = response[:current][:weather][0]

          expect(weather[:id]).to be_a(Integer)
          expect(weather[:main]).to be_a(String)
          expect(weather[:description]).to be_a(String)
          expect(weather[:icon]).to be_a(String)

          hourly = response[:hourly][0]

          expect(hourly[:dt]).to be_a(Integer)
          expect(hourly[:temp]).to be_a(Float)
          expect(hourly[:feels_like]).to be_a(Float)
          expect(hourly[:pressure]).to be_a(Integer)
          expect(hourly[:humidity]).to be_a(Integer)
          expect(hourly[:dew_point]).to be_a(Float)
          expect(hourly[:uvi]).to be_a(Integer)
          expect(hourly[:clouds]).to be_a(Integer)
          expect(hourly[:visibility]).to be_a(Integer)
          expect(hourly[:wind_speed]).to be_a(Float)
          expect(hourly[:wind_deg]).to be_a(Integer)

          expect(response[:hourly][0][:weather]).to be_an(Array)
          hourly_weather = response[:hourly][0][:weather][0]

          expect(hourly_weather[:id]).to be_a(Integer)
          expect(hourly_weather[:main]).to be_a(String)
          expect(hourly_weather[:description]).to be_a(String)
          expect(hourly_weather[:icon]).to be_a(String)

          daily = response[:daily][0]

          expect(daily[:dt]).to be_a(Integer)
          expect(daily[:sunrise]).to be_a(Integer)
          expect(daily[:sunset]).to be_a(Integer)
          expect(daily[:moonrise]).to be_a(Integer)
          expect(daily[:moonset]).to be_a(Integer)
          expect(daily[:moon_phase]).to be_a(Float)

          expect(daily[:temp]).to be_a(Hash)
          expect(daily[:temp][:day]).to be_a(Float)
          expect(daily[:temp][:min]).to be_a(Float)
          expect(daily[:temp][:max]).to be_a(Float)
          expect(daily[:temp][:night]).to be_a(Float)
          expect(daily[:temp][:eve]).to be_a(Float)
          expect(daily[:temp][:morn]).to be_a(Float)

          expect(daily[:feels_like]).to be_a(Hash)
          expect(daily[:feels_like][:day]).to be_a(Float)
          expect(daily[:feels_like][:night]).to be_a(Float)
          expect(daily[:feels_like][:eve]).to be_a(Float)
          expect(daily[:feels_like][:morn]).to be_a(Float)

          expect(daily[:pressure]).to be_a(Integer)
          expect(daily[:humidity]).to be_a(Integer)
          expect(daily[:dew_point]).to be_a(Float)
          expect(daily[:wind_speed]).to be_a(Float)
          expect(daily[:wind_deg]).to be_a(Integer)

          expect(response[:daily][0][:weather]).to be_an(Array)
          daily_weather = response[:daily][0][:weather][0]

          expect(daily_weather[:id]).to be_a(Integer)
          expect(daily_weather[:main]).to be_a(String)
          expect(daily_weather[:description]).to be_a(String)
          expect(daily_weather[:icon]).to be_a(String)

          expect(daily[:clouds]).to be_a(Integer)
          expect(daily[:pop]).to be_a(Float)
          expect(daily[:rain]).to be_a(Float)
          expect(daily[:uvi]).to be_a(Float)
      end
    end
  end
end
