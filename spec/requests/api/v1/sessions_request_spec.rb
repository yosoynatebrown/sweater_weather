require 'rails_helper'

describe 'Sessions API' do
  let(:headers) {
    {
      "Content-Type" => "application/json",
      "Accept"  => "application/json"
    }
               }
  context 'when password is valid' do
    it 'will login a user' do
      user = create(:user)
      params = {
      "email": user.email,
      "password": "password123",
      }
      post "/api/v1/sessions", headers: headers, params: params.to_json

      expect(response.status).to eq(200)
      
      login = JSON.parse(response.body, symbolize_names: true)

      expect(login).to have_key(:data)
      expect(login[:data]).to have_key(:id)
      expect(login[:data]).to have_key(:type)
      expect(login[:data]).to have_key(:attributes)
      expect(login[:data][:type]).to eq("users")
      expect(login[:data][:attributes]).to have_key(:email)
      expect(login[:data][:attributes][:email]).to be_a String

      expect(login[:data][:attributes]).to have_key(:api_key)
      expect(login[:data][:attributes][:api_key]).to be_a String
    end
  end

  context 'when password is invalid' do
    it 'will return an error' do
      user = create(:user)
      params = {
      "email": user.email,
      "password": "wrong_password",
      }
      post "/api/v1/sessions", headers: headers, params: params.to_json

      expect(response.status).to eq(401)
      
      login = JSON.parse(response.body, symbolize_names: true)

      expect(login[:message]).to eq("Incorrect credentials")
      expect(login[:errors][0]).to eq("Your login or API key is invalid. Cannot authenticate.")
    end
  end

  context 'when email is invalid' do
    it 'will return the same error' do
      user = create(:user)
      params = {
      "email": "wrong_email@madeup123.com",
      "password": "password123",
      }
      post "/api/v1/sessions", headers: headers, params: params.to_json

      expect(response.status).to eq(401)
      
      login = JSON.parse(response.body, symbolize_names: true)
      
      expect(login[:message]).to eq("Incorrect credentials")
      expect(login[:errors][0]).to eq("Your login or API key is invalid. Cannot authenticate.")
    end
  end
end