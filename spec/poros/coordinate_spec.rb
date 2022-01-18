require 'rails_helper'

describe Coordinate do
  it 'has attributes' do
    coordinate = Coordinate.new(coordinate_data)

    expect(coordinate.latitude).to eq(39.738453)
    expect(coordinate.longitude).to eq(-104.984853)
  end
end
