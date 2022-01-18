require 'rails_helper'

RSpec.describe 'Unsplash Facade' do
  it '.image', :vcr do
    image = UnsplashFacade.image('Denver, CO')

    expect(image).to be_a Image
  end
end
