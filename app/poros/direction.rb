# frozen_string_literal: true

class Direction
  attr_reader :travel_time

  def initialize(data)
    @travel_time = data[:formattedTime]
  end
end
