require 'rails_helper'

RSpec.describe Forecast do
  describe '#initialize' do
    it 'encapsulates forecast data into object' do
      daily_forecast = {
           :dt=>1628528400,
           :sunrise=>1628503241,
           :sunset=>1628553736,
           :moonrise=>1628506200,
           :moonset=>1628557680,
           :moon_phase=>0.04,
           :temp=>{:day=>299.68, :min=>294.62, :max=>300, :night=>297.42, :eve=>299.48, :morn=>294.64},
           :feels_like=>{:day=>299.68, :night=>297.86, :eve=>299.48, :morn=>295.06},
           :pressure=>1020,
           :humidity=>65,
           :dew_point=>292.57,
           :wind_speed=>5.14,
           :wind_deg=>11,
           :wind_gust=>8.21,
           :weather=>[{:id=>500, :main=>"Rain", :description=>"light rain", :icon=>"10d"}],
           :clouds=>77,
           :pop=>0.6,
           :rain=>0.66,
           :uvi=>5.22
         }

      daily = Daily.new(daily_forecast)

      expect(daily.conditions).to be_a(String)
      expect(daily.date).to be_a(String)
      expect(daily.sunrise).to be_a(String)
      expect(daily.sunset).to be_a(String)
      expect(daily.humidity).to be_a(Integer)
      expect(daily.min_temp).to be_a(Integer)
    end
  end
end
