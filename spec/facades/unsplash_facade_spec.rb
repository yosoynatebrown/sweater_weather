# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Unsplash Facade' do
  it '.image', :vcr do
    image = UnsplashFacade.image('Denver, CO')
   
    expect(image).to be_a Image
  end

  it 'handles different times of day' do
    time = Time.local(2021,"jan",1,1,59,1)
    allow(Time).to receive(:now).and_return(time)
    expect(UnsplashFacade.time_of_day).to eq("middle of the night")
    
    time = Time.local(2021,"jan",1,7,59,1)
    allow(Time).to receive(:now).and_return(time)
    expect(UnsplashFacade.time_of_day).to eq("morning")

    time = Time.local(2021,"jan",1,11,59,1)
    allow(Time).to receive(:now).and_return(time)
    expect(UnsplashFacade.time_of_day).to eq("noon")

    time = Time.local(2021,"jan",1,13,59,1)
    allow(Time).to receive(:now).and_return(time)
    expect(UnsplashFacade.time_of_day).to eq("afternoon")

    time = Time.local(2021,"jan",1,18,59,1)
    allow(Time).to receive(:now).and_return(time)
    expect(UnsplashFacade.time_of_day).to eq("evening")

    time = Time.local(2021,"jan",1,23,59,1)
    allow(Time).to receive(:now).and_return(time)
    expect(UnsplashFacade.time_of_day).to eq("night")
  end
end
