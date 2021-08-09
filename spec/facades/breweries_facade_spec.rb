require 'rails_helper'

RSpec.describe BreweriesFacade do
  describe 'methods' do
    it "gets Breweries data", :vcr do
      details = BreweriesFacade.get_breweries_data('Brooklyn,NY')

      expect(details).to be_an(Array)
    end
  end
end
