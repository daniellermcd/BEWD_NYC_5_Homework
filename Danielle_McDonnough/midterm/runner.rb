require_relative 'concert'
require_relative 'artist'

puts "Search for upcoming concert dates for your favorite bands or artists"
puts "Who would you like to search for?"
query = gets.chomp
artist = Artist.new query

if artist.info.class == Hash
  if artist.upcoming_events_count.zero?
    puts "Sorry, there are no upcoming concert dates for #{artist.name}."
  else
    puts "Where would you like to search for #{artist.name} concerts?"
    puts "e.g., 'New York, NY' or 'london', or press <enter> for all upcoming concert dates"
    location = gets.chomp

    if location.empty?
      # return all concerts
      puts "Here are the upcoming concert dates for #{artist.name}:"
      artist.all_concerts.each { |concert| puts concert.show }
    else
      puts "Within what distance? e.g., '50' for within 50 miles"
      radius = gets.chomp
      # to-do: check that radius is an integer greater than 0
      recommended = artist.recommended( location.gsub(", ", ","), radius )
      if recommended.empty?
        puts "Sorry, there are no upcoming concert dates for #{artist.name} within #{radius} miles of #{location}."
      elsif recommended.first.class == Concert
        puts "Here are the upcoming concert dates for #{artist.name} within #{radius} miles of #{location}:"
        recommended.each { |concert| puts concert.show }
        # to-do: display results matching location first
      else
        recommended.each { |error| puts "Error: #{error}" }
      end
    end
  end
else
  artist.info.each { |error| puts "Error: #{error}" }
end