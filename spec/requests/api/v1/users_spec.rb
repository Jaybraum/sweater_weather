require 'rails_helper'

RSpec.describe 'Users API' do
  describe 'Post /users' do
    it "Registers users" do
      post '/api/v1/users', params:
      {
        email: 'Jay@test.com',
        password: '123456',
        password_confirmation: '123456'
      }

      expect(response).to have_http_status(201)

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
  end
end
