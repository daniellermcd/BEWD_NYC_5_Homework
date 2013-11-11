require_relative 'concert'
require 'rest-client'
require 'json'
require 'uri'

puts 'Search for upcoming concert dates for your favorite bands or artists'
puts 'Who would you like to search for?'
query = gets.chomp

result = RestClient.get URI.escape("http://api.bandsintown.com/artists/#{query}/events.json?api_version=2.0&app_id=daniellermcd")
parsed = JSON.parse result

concerts = parsed.collect do |e|
  Concert.new e["title"], e["formatted_datetime"], e["formatted_location"], e["venue"]["name"], e["ticket_status"]
end

if concerts.empty?
  puts "There are no upcoming concert dates for \"#{query}.\""
else
  puts "Here are the upcoming concert dates for \"#{query}\":"
  puts
  concerts.each do |concert|
    puts concert
    # can't figure out why the object id for each Concert object is also being returned
  end
end