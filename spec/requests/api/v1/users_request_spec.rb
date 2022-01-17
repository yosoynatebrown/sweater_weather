require 'rails_helper'

describe 'Users API' do
  let(:params) {
    {
      "email": "whatever123@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
               }
  let(:headers) {
    {
      "Content-Type" => "application/json",
      "Accept"  => "application/json"
    }
               }
    let(:invalid_params) {
    {
      "email": "whatever123@example.com",
      "password": "password",
      "password_confirmation": "password_no_match"
    }
                         }

  context 'when passwords match' do
    it 'will create a user' do
      post "/api/v1/users", headers: headers, params: params.to_json


      expect(response.status).to eq(201)
      
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
  context 'when passwords do not match and email is not unique' do
    it 'will not create a user and send back an error' do
      post "/api/v1/users", headers: headers, params: params.to_json
      post "/api/v1/users", headers: headers, params: invalid_params.to_json


      expect(response.status).to eq(401)
      
      errors = JSON.parse(response.body, symbolize_names: true)

      
      expect(errors).to have_key(:message)
      expect(errors[:message]).to eq("Incorrect credentials")

      expect(errors).to have_key(:errors)
      expect(errors[:errors]).to eq(["Your login or API key is invalid. Cannot authenticate."])
    end
  end
end