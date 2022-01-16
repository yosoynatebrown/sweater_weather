require 'rails_helper'

RSpec.describe 'Coordinate search' do
  it 'can find the coordinate of a city', :vcr do
    response = MapquestService.coordinates("Denver,CO")

    expect(response).to be_a Hash
    expect(response[:results]).to be_an Array
    expect(response[:results][0]).to be_a Hash
    expect(response[:results][0][:locations]).to be_an Array
    expect(response[:results][0][:locations][0]).to be_a Hash
    expect(response[:results][0][:locations][0][:latLng]).to be_a Hash

    coordinate_data = response[:results][0][:locations][0][:latLng]

    expect(coordinate_data).to have_key :lat
    expect(coordinate_data[:lat]).to be_a Float

    expect(coordinate_data).to have_key :lng
    expect(coordinate_data[:lng]).to be_a Float
  end
end
