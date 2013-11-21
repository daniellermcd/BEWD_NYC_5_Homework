#This program uses the Google maps api to return the distance between two zipcodes.

require_relative "zipcode.rb"
require_relative "google_distance.rb"

puts "Find the distance between two zip codes..."

input_valid = false
while !input_valid do
  puts "Enter the origin and destination zipcodes. (eg. \"10001 10011\") \n>"
  input = gets.chomp
  origin, destination = input.split(' ').collect { |zip| Zipcode.new(zip) }

  if !origin || !origin.valid?
    puts "Origin is not a valid zipcode."
  elsif !destination || !destination.valid?
    puts "Destination is not a valid zipcode."
  else
    input_valid = true
  end
end

maps_result = GoogleDistance.find_by_zip origin, destination

if maps_result.origin_address.empty?
  puts "Google couldn't find the origin zipcode(#{origin})."
elsif maps_result.destination_address.empty?
  puts "Google couldn't find the destination zipcode (#{destination})."
else
  puts "The distance from #{maps_result.origin_address} to #{maps_result.destination_address} is #{maps_result.distance}."
end