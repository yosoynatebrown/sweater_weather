require 'rails_helper'

describe RoadTrip do 
  let(:road_trip) { RoadTrip.new("Fort Collins, CO", road_trip_data) }
    it 'has attributes' do

      # expect(Roadtrip).to be_a Hash
      # expect(Roadtrip).to eq("Fort Collins, CO")
    end 
end