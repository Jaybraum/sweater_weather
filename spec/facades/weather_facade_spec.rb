require 'rails_helper'

RSpec.describe WeatherFacade do
  describe 'Forecast methods' do
    it "::get_full_forecast", :vcr do
      details = WeatherFacade.full_forecast('Brooklyn,NY')

      expect(details).to be_an(Forecast)

      current = details.current

      expect(current.conditions).to be_a(String)
      expect(current.datetime).to be_a(String)
      expect(current.sunrise).to be_a(String)
      expect(current.sunset).to be_a(String)
      expect(current.feels_like).to be_a(Float)
      expect(current.humidity).to be_a(Integer)
      expect(current.temperature).to be_a(Float)
      expect(current.uvi).to be_a(Float)
      expect(current.icon).to be_a(String)
      expect(current.visibility).to be_a(Integer)

      daily = details.daily[0]

      expect(daily.conditions).to be_a(String)
      expect(daily.date).to be_a(String)
      expect(daily.sunrise).to be_a(String)
      expect(daily.sunset).to be_a(String)
      expect(daily.humidity).to be_a(Integer)
      expect(daily.min_temp).to be_a(Float)
      expect(daily.max_temp).to be_a(Float)

      hourly = details.hourly[0]

      expect(hourly.time).to be_a(String)
      expect(hourly.temperature).to be_a(Float)
      expect(hourly.conditions).to be_a(String)
      expect(hourly.icon).to be_a(String)
    end

    it "::current_forecast", :vcr do
      forecast_data ={
             :dt=>1628543289,
             :sunrise=>1628503241,
             :sunset=>1628553736,
             :temp=>299.41,
             :feels_like=>299.41,
             :pressure=>1020,
             :humidity=>73,
             :dew_point=>294.19,
             :uvi=>1.46,
             :clouds=>40,
             :visibility=>10000,
             :wind_speed=>0.45,
             :wind_deg=>124,
             :wind_gust=>1.34,
             :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03d"}]
           }
      current = WeatherFacade.current_forecast(forecast_data)

      expect(current).to be_an(Current)

      expect(current.conditions).to be_a(String)
      expect(current.datetime).to be_a(String)
      expect(current.sunrise).to be_a(String)
      expect(current.sunset).to be_a(String)
      expect(current.feels_like).to be_a(Float)
      expect(current.humidity).to be_a(Integer)
      expect(current.temperature).to be_a(Float)
      expect(current.uvi).to be_a(Float)
      expect(current.icon).to be_a(String)
      expect(current.visibility).to be_a(Integer)
    end

    it "::daily_forecast", :vcr do
      forecast_data = ForecastService.get_forecast_details(40.692529, -73.990996)

      daily = WeatherFacade.daily_forecast(forecast_data[:daily])

      expect(daily.count).to eq(5)

      expect(daily[0].conditions).to be_a(String)
      expect(daily[0].date).to be_a(String)
      expect(daily[0].sunrise).to be_a(String)
      expect(daily[0].sunset).to be_a(String)
      expect(daily[0].humidity).to be_a(Integer)
      expect(daily[0].min_temp).to be_a(Float)
    end

    it "::hourly_forecast", :vcr do
      forecast_data = ForecastService.get_forecast_details(40.692529, -73.990996)

      hourly = WeatherFacade.hourly_forecast(forecast_data[:hourly])

      expect(hourly[0].time).to be_a(String)
      expect(hourly[0].temperature).to be_a(Float)
      expect(hourly[0].conditions).to be_a(String)
      expect(hourly[0].icon).to be_a(String)
    end
  end

  describe 'Road_Trip methods' do
    it "::get_road_trip", :vcr do
      details = WeatherFacade.road_trip('Brooklyn, NY', 'Miami, FL')

      expect(details).to be_an(RoadTrip)

      expect(details.origin).to be_an(String)
      expect(details.destination).to be_an(String)
      expect(details.conditions).to be_an(String)
      expect(details.temperature).to be_an(Float)
      expect(details.travel_time).to be_an(String)
    end
  end

  describe 'Image methods' do
    it "::gets_image", :vcr do
      details = WeatherFacade.retrieve_image('Brooklyn,NY')

      expect(details).to be_an(Array)
      expect(details.first).to be_an(Image)
      expect(details.first.author).to be_an(String)
      expect(details.first.image_url).to be_an(String)
      expect(details.first.description).to be_an(String)
    end
  end

  describe 'Coordinate methods' do
    it "::gets_coordinates", :vcr do
      details = WeatherFacade.retrieve_coordinates('Brooklyn,NY')

      expect(details).to be_an(Array)
      expect(details.first).to be_an(Coordinate)
      expect(details.first.lat).to be_an(Float)
      expect(details.first.lng).to be_a(Float)
    end
  end
end
