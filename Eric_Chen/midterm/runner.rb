#This program uses the Google maps api to return the distance between two zipcodes.

require "RestClient"
require "JSON"
require_relative "zipcode.rb"

puts "Find the distance between two zip codes..."

input_valid = false
while !input_valid do
  puts "Enter the origin and destination zipcodes. (eg. \"10001 10011\") \n>"
  # input = gets.chomp
  input = "10011 99999"
  origin, destination = input.split(' ').collect { |zip| Zipcode.new(zip) }

  if !origin || !origin.valid?
    puts "Origin is not a valid zipcode."
  elsif !destination || !destination.valid?
    puts "Destination is not a valid zipcode."
  else
    input_valid = true
  end
end

result = RestClient.get("http://maps.googleapis.com/maps/api/distancematrix/json?origins=#{origin}&destinations=#{destination}&sensor=false")
parsed = JSON.parse(result)

origin_address = parsed["origin_addresses"].first
destination_address = parsed["destination_addresses"].first

if origin_address.empty?
  puts "Google couldn't find the origin zipcode."
elsif destination_address.empty?
  puts "Google couldn't find the destination zipcode."
else
  distance = parsed["rows"].first["elements"].first["distance"]["text"]

  puts "The distance from #{origin_address} to #{destination_address} is #{distance}."
end