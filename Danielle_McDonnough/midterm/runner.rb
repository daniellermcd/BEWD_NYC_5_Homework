require_relative 'concert'
require 'rest-client'
require 'json'
require 'uri'

puts 'Search for upcoming concert dates for your favorite bands or artists'
puts 'Who would you like to search for?'
query = gets.chomp

result = RestClient.get URI.escape("http://api.bandsintown.com/artists/#{query}/events.json?api_version=2.0&app_id=daniellermcd")
# need to check if 404 code is returned when artist is not found
parsed = JSON.parse result

concerts = parsed.collect do |concert|
  Concert.new title: concert["title"], datetime: concert["formatted_datetime"], location: concert["formatted_location"], venue: concert["venue"]["name"], status: concert["ticket_status"]
end

if concerts.empty?
  puts "There are no upcoming concert dates for \"#{query}.\""
else
  puts "Here are the upcoming concert dates for \"#{query}\":"
  puts
  concerts.each do |concert|
    concert.show
  end
end