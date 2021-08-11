require 'rails_helper'

RSpec.describe 'Sessions API' do
  describe 'Post /sessions' do
    it "Logs user in" do
      post '/api/v1/sessions', params: {
        email: "whatever@example.com",
        password: "password",
      }

      expect(response).to have_http_status(200)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to be_a(Hash)
      expect(data[:data]).to be_a(Hash)
      expect(data[:data][:id]).to be_a(Integer)
      expect(data[:data][:type]).to eq('users')
      expect(data[:data][:attributes]).to be_a(Hash)

      user_data = data[:data][:attributes]
      expect(user_data[:email]).to be_an(String)
      expect(user_data[:api_key]).to be_an(String)
    end

    it 'Returns an error message', :vcr do
      post '/api/v1/sessions', params: {
        email: "whatever@example.com",
        password: 000
      }

      expect(response).to have_http_status(401)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to eq({error: 'Invalid Credentials'})
    end
  end
end
