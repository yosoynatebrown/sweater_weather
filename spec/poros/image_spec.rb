# frozen_string_literal: true

require 'rails_helper'

describe Image do
  let(:image) { Image.new('Fort Collins, CO', image_data) }
  it 'has attributes' do
    expect(image.image).to be_a Hash
    expect(image.image[:location]).to eq('Fort Collins, CO')
    expect(image.image[:image_url]).to eq('https://images.unsplash.com/photo-1634507307799-ace9b49840b7?ixid=MnwyOTE0ODd8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfHx8fDE2NDIyODg5Mzk&ixlib=rb-1.2.1')
    expect(image.image[:credit]).to be_a Hash
    expect(image.image[:credit][:source]).to eq('https://unsplash.com/?utm_source=sweater_weather&utm_medium=referral')
    expect(image.image[:credit][:author]).to eq('Dillon Wanner')
    expect(image.image[:credit][:author_url]).to eq('https://unsplash.com/@dillydallying?utm_source=sweater_weather&utm_medium=referral')
  end
end
