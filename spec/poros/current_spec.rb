require 'rails_helper'

RSpec.describe Forecast do
  describe '#initialize' do
    it 'encapsulates forecast data into object' do
      current_details = {
         :dt=>1628542968,
         :sunrise=>1628503241,
         :sunset=>1628553736,
         :temp=>299.46,
         :feels_like=>299.46,
         :pressure=>1020,
         :humidity=>74,
         :dew_point=>294.46,
         :uvi=>1.46,
         :clouds=>40,
         :visibility=>10000,
         :wind_speed=>0.45,
         :wind_deg=>178,
         :wind_gust=>1.34,
         :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03d"}]
       }
       current = Current.new(current_details)

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
  end
end
