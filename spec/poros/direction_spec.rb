require 'rails_helper'

describe Direction do 
    it 'has attributes' do 
        directions = Direction.new(directions_data)

        expect(directions.time).to eq("14:58:56")
    end 
end 