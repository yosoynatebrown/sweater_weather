require 'rails_helper'

RSpec.describe 'Mapquest search' do
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

  it 'can find the distance to an address', :vcr do
    response = MapquestService.directions("Denver, CO", "Los Angeles, CA")
    
    expect(response).to be_a Hash
    expect(response[:route]).to be_an Hash

    route_data = response[:route]

    expect(route_data[:formattedTime]).to be_a String
  end

  it 'returns an error if directions are impossible', :vcr do
    response = MapquestService.directions("London, UK", "Los Angeles, CA")

    expect(response[:route][:formattedTime]).to be nil
    expect(response).to be_a Hash
    expect(response[:info]).to be_a Hash
    expect(response[:info][:messages]).to be_a Array

    error_data = response[:info][:messages]

    expect(error_data[0]).to be_a String
  end
end
