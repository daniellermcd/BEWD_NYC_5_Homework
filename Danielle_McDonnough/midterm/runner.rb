require_relative 'concert'
require_relative 'artist'
require 'rest-client'
require 'json'
require 'uri'

puts "Search for upcoming concert dates for your favorite bands or artists"
puts "Who would you like to search for?"
query = gets.chomp
artist = Artist.new query

if artist.number_of_upcoming_events.zero?
  puts "Sorry, there are no upcoming concert dates for #{artist.name}."
else
  puts "What city would you like to search for #{artist.name} concerts in (e.g., 'London' or press ENTER for all upcoming concert dates)?"
  city = gets.chomp.downcase

  if city.empty?
    # return all concerts
    puts "Here are the upcoming concert dates for #{artist.name}:"
    artist.concerts.each do |concert|
      puts
      puts concert.show
    end
  else
    # create an array of Concert objects filtered by city
    filtered = artist.concerts.collect do |concert|
      # for each Concert object in all concerts, check if the location includes city and add it to the array
      if concert.location.downcase.include? city
        concert
      end
    end

    # scrub nil elements from filtered array
    filtered.reject! { |x| x.nil? }

    if filtered.empty?
      puts "Sorry, there are no upcoming concert dates for #{artist.name} in #{city}."
    else
      puts "Here are the upcoming concert dates for #{artist.name} in #{filtered.first.location}:"
      # return all concerts in filtered array
      filtered.each do |concert|
        puts
        puts concert.show
      end
    end
  end
end