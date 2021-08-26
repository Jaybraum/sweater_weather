require 'rails_helper'

RSpec.describe Forecast do
  describe '#initialize' do
    it 'encapsulates forecast data into object', :vcr do
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
  end
end
