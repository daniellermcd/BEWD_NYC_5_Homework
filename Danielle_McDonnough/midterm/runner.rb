require_relative 'concert'
require_relative 'artist'

puts "Search for upcoming concert dates for your favorite bands or artists"
puts "Who would you like to search for?"
query = gets.chomp
artist = Artist.new query

if artist.exists?
  if artist.number_of_upcoming_events.zero?
    puts "Sorry, there are no upcoming concert dates for #{artist.name}."
  else
    puts "Where would you like to search for #{artist.name} concerts?"
    puts "e.g., 'London' or 'NY', or press <enter> for all upcoming concert dates"
    city = gets.chomp.downcase

    if city.empty?
      # return all concerts
      puts "Here are the upcoming concert dates for #{artist.name}:"
      artist.concerts.each { |concert| puts concert.show }
    else
      # create an array of Concert objects filtered by city
      filtered = artist.concerts.collect do |concert|
        # for each Concert object in all concerts, check if the location includes city and add it to the array
        if concert.location.downcase.include? city
          concert
        end
      end

      # scrub nil elements from filtered array
      filtered.compact!

      if filtered.empty?
        puts "Sorry, there are no upcoming concert dates for #{artist.name} in '#{city}.'"
      else
        puts "Here are the upcoming concert dates for #{artist.name} in '#{city}':"
        # return all concerts in filtered array
        filtered.each { |concert| puts concert.show }
      end
    end
  end
else
  puts "Error: artist '#{query}' does not exist"
end