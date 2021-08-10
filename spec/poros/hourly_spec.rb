require 'rails_helper'

RSpec.describe Forecast do
  describe '#initialize' do
    it 'encapsulates hourly data into object' do
      hourly_details = {
         :dt=>1628542800,
         :temp=>299.41,
         :feels_like=>299.41,
         :pressure=>1020,
         :humidity=>73,
         :dew_point=>294.19,
         :uvi=>1.46,
         :clouds=>40,
         :visibility=>10000,
         :wind_speed=>3.12,
         :wind_deg=>99,
         :wind_gust=>2.91,
         :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03d"}],
         :pop=>0.52
       }

      hourly = Hourly.new(hourly_details)

      expect(hourly.time).to be_a(String)
      expect(hourly.temperature).to be_a(Float)
      expect(hourly.conditions).to be_a(String)
      expect(hourly.icon).to be_a(String)
    end
  end
end
