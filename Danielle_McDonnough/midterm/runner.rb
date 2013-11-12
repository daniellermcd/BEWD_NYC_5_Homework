require_relative 'concert'
require 'rest-client'
require 'json'
require 'uri'

puts 'Search for upcoming concert dates for your favorite bands or artists'
puts 'Who would you like to search for?'
artist = gets.chomp

artist_info = RestClient.get URI.escape("http://api.bandsintown.com/artists/#{artist}.json?api_version=2.0&app_id=daniellermcd")
artist_info_parsed = JSON.parse artist_info
artist_name = artist_info_parsed["name"]
# need to check if 404 code is returned when artist is not found

if artist_info_parsed["upcoming_events_count"].zero?
  puts "There are no upcoming concert dates for #{artist_name}."
else
  artist_events = RestClient.get URI.escape("http://api.bandsintown.com/artists/#{artist}/events.json?api_version=2.0&app_id=daniellermcd")
  events_parsed = JSON.parse artist_events

  all_concerts = events_parsed.collect do |concert|
    Concert.new title: concert["title"], datetime: concert["formatted_datetime"], location: concert["formatted_location"], venue: concert["venue"]["name"], status: concert["ticket_status"]
  end

  puts "What city would you like to search for #{artist_name} concerts in (e.g., \"London\" or \"all\")?"
  city = gets.chomp.downcase

  if city == 'all'
    puts
    puts "Here are the upcoming concert dates for #{artist_name}:"
    puts
    all_concerts.each do |concert|
      concert.show
    end
  else
    concerts_filtered = all_concerts.collect do |concert|
      if concert.location.downcase.include? city
        concert
      end
    end

    concerts_filtered.reject! { |x| x.nil? }

    if concerts_filtered.empty?
      puts
      puts "There are no upcoming concert dates for #{artist_name} in \"#{city}.\""
      puts
    else
      puts
      puts "Here are the upcoming concert dates for #{artist_name} in #{concerts_filtered.first.location}:"
      puts
      concerts_filtered.each do |concert|
        concert.show
      end
    end
  end
end