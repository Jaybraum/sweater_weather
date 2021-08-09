require 'rails_helper'

RSpec.describe Forecast do
  describe '#initialize' do
    it 'encapsulates forecast data into object' do
      current = {
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
         :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03d"}]}
      }

      forecast = Forecast.new(forecast_details)

      expect(forecast_details.name).to eq('Union Lodge No.1')
      expect(forecast_details.thumbnail).to eq('https://s3-media2.fl.yelpcdn.com/bphoto/oQcctWaIVGkoE1pKGlHA6Q/o.jpg')
      expect(forecast_details.address).to eq(['1543 Champa St', 'Denver, CO 80202'])
      expect(forecast_details.business_type).to eq([{'alias': 'cocktailbars', 'title': 'Cocktail Bars'}, { 'alias': 'lounges', 'title': 'Lounges'}])
      expect(forecast_details.yelp_link).to eq('https://www.yelp.com/biz/union-lodge-no-1-denver?adjust_creative=9gPw-kuPiDZgFQ3Tr4ox3Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=9gPw-kuPiDZgFQ3Tr4ox3Q')
    end
  end
end
