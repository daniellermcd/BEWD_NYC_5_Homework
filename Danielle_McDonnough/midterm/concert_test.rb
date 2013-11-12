require_relative 'concert'
require 'minitest/autorun'

describe Concert do
  let(:concert) { Concert.new title: 'The Spice Girls Reunion Tour', datetime: 'Monday, March 24, 2014 at 9:00PM', location: 'Mexico City, Mexico', venue: 'El Plaza Condesa', status: 'available' }

  it "initializes with hash" do
    concert.location.must_equal 'Mexico City, Mexico'
  end

  it "initializes with defaults" do
    c = Concert.new
    c.location.must_equal ''
  end

  it "can be shown" do
    concert.show.must_equal [ "**** The Spice Girls Reunion Tour ****", "Date: Monday, March 24, 2014 at 9:00PM", "City: Mexico City, Mexico", "Venue: El Plaza Condesa", "Ticket Status: Available" ]
  end
end