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
  end
end