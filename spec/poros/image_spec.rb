require 'rails_helper'

RSpec.describe Image do
  describe '#initialize' do
    it 'encapsulates Image data into object', :vcr do
      image = WeatherFacade.retrieve_image('Brooklyn,NY')

      expect(image).to be_an(Image)
      expect(image.description).to be_a(String)
      expect(image.location).to be_a(String)
      expect(image.image_url).to be_a(String)
      expect(image.author).to be_a(String)
    end
  end
end
