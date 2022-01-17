require 'rails_helper'

RSpec.describe 'Image search' do
  it 'can find the image of a city', :vcr do
    response = UnsplashService.images('Denver,CO')

    expect(response).to be_a Hash
    expect(response[:results]).to be_an Array
    expect(response[:results][0]).to be_a Hash

    image_data = response[:results][0]

    expect(image_data).to have_key :urls
    expect(image_data[:urls]).to be_a Hash

    expect(image_data[:urls]).to have_key :raw
    expect(image_data[:urls][:raw]).to be_a String
  end
end
