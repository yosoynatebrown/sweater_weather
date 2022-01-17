require 'rails_helper'

describe 'RoadTrip API' do
  let(:headers) {
    {
      "Content-Type" => "application/json",
      "Accept"  => "application/json"
    }
               }
  it 'works with trips less than 8 hours', :vcr do
    params = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "ysbzsAXn8vcmift9Thn9mSFE"
      }
      post "/api/v1/road_trip", headers: headers, params: params.to_json

      expect(response.status).to eq(200)
      
      road_trip = JSON.parse(response.body, symbolize_names: true)

      expect(road_trip).to have_key(:data)
      expect(road_trip[:data]).to have_key(:id)

      expect(road_trip[:data][:type]).to eq("road_trip")
      expect(road_trip[:data]).to have_key(:attributes)
      expect(road_trip[:data][:attributes]).to have_key(:start_city)
      expect(road_trip[:data][:attributes][:start_city]).to be_a String

      expect(road_trip[:data][:attributes]).to have_key(:end_city)
      expect(road_trip[:data][:attributes][:end_city]).to be_a String

      expect(road_trip[:data][:attributes]).to have_key(:travel_time)
      expect(road_trip[:data][:attributes][:travel_time]).to be_a String

      expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to be_a Hash
    end
  it 'works with trips longer than 8 hours', :vcr do
    params = {
      "origin": "New York City, NY",
      "destination": "Los Angeles, CA",
      "api_key": "ysbzsAXn8vcmift9Thn9mSFE"
      }
    post "/api/v1/road_trip", headers: headers, params: params.to_json

    expect(response.status).to eq(200)
    
    road_trip = JSON.parse(response.body, symbolize_names: true)

    expect(road_trip).to have_key(:data)
    expect(road_trip[:data]).to have_key(:id)

    expect(road_trip[:data][:type]).to eq("road_trip")
    expect(road_trip[:data]).to have_key(:attributes)
    expect(road_trip[:data][:attributes]).to have_key(:start_city)
    expect(road_trip[:data][:attributes][:start_city]).to be_a String

    expect(road_trip[:data][:attributes]).to have_key(:end_city)
    expect(road_trip[:data][:attributes][:end_city]).to be_a String

    expect(road_trip[:data][:attributes]).to have_key(:travel_time)
    expect(road_trip[:data][:attributes][:travel_time]).to be_a String

    expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
    expect(road_trip[:data][:attributes][:weather_at_eta]).to be_a Hash
  end

  it 'returns error json if api key is invalid', :vcr do
    params = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "blahblahfakeapikeyhere"
      }
      post "/api/v1/road_trip", headers: headers, params: params.to_json

      expect(response.status).to eq(401)
      
      road_trip = JSON.parse(response.body, symbolize_names: true)

      expect(road_trip).to have_key(:message)
      expect(road_trip[:message]).to eq("Incorrect credentials")

      expect(road_trip).to have_key(:errors)
      expect(road_trip[:errors]).to eq(["Your login or API key is invalid. Cannot authenticate."])
  end

  it 'returns error json if api key is absent', :vcr do
    params = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": nil
      }
      post "/api/v1/road_trip", headers: headers, params: params.to_json

      expect(response.status).to eq(401)
      
      road_trip = JSON.parse(response.body, symbolize_names: true)

      expect(road_trip).to have_key(:message)
      expect(road_trip[:message]).to eq("Incorrect credentials")

      expect(road_trip).to have_key(:errors)
      expect(road_trip[:errors]).to eq(["Your login or API key is invalid. Cannot authenticate."])
  end
end