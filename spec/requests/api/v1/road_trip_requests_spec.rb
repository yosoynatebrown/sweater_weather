require 'rails_helper'

describe 'RoadTrip API' do
  let(:headers) {
    {
      "Content-Type" => "application/json",
      "Accept"  => "application/json"
    }
               }
  it 'works', :vcr do
    params = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "ysbzsAXn8vcmift9Thn9mSFE"
      }
      post "/api/v1/road_trip", headers: headers, params: params.to_json

      expect(response.status).to eq(200)
      
      login = JSON.parse(response.body, symbolize_names: true)

      expect(login).to have_key(:data)
    end

end