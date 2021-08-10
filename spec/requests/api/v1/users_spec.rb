require 'rails_helper'

RSpec.describe 'Users API' do
  describe 'Post /users' do
    it "Registers users" do
      post '/api/v1/users', params: {location: 'Brooklyn,NY'}

      expect(response).to have_http_status(201)

      require "pry"; binding.pry

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to be_a(Hash)
      expect(data[:data]).to be_a(Hash)
      expect(data[:data][:id]).to eq(nil)
      expect(data[:data][:type]).to eq('image')
      expect(data[:data][:attributes]).to be_a(Hash)

      image_data = data[:data][:attributes][:image]
      expect(image_data[:location]).to be_an(String)
      expect(image_data[:image_url]).to be_an(String)
      expect(image_data[:description]).to be_an(String)

      credit_data = data[:data][:attributes][:credit]
      expect(credit_data[:source]).to eq('unsplash.com')
      expect(credit_data[:author]).to be_an(String)
    end
  end
end
