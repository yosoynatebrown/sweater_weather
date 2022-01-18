# frozen_string_literal: true

require 'rails_helper'

describe 'Backgrounds API' do
  it 'responds with an image JSON', :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response.status).to eq(200)

    background = JSON.parse(response.body, symbolize_names: true)

    expect(background).to have_key(:data)
    expect(background[:data][:id]).to eq(nil)
    expect(background[:data][:type]).to eq('image')
    expect(background[:data]).to have_key(:attributes)
    expect(background[:data][:attributes]).to have_key(:image)

    expect(background[:data][:attributes][:image][:location]).to be_a String
    expect(background[:data][:attributes][:image][:image_url]).to be_a String
    expect(background[:data][:attributes][:image][:credit][:source]).to be_a String
    expect(background[:data][:attributes][:image][:credit][:author]).to be_a String
    expect(background[:data][:attributes][:image][:credit][:author_url]).to be_a String
  end
end
