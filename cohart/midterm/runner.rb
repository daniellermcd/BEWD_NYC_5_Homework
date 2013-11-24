require 'rubygems'
require 'json'
require 'twitter'
require 'geocoder'

client = Twitter.configure do |config| 
        config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
        config.oauth_token = ENV["OAUTH_TOKEN"]
        config.oauth_token_secret = ENV["OAUTH_SECRET"]
end

#introduction stuff.
puts "Welcome to TweetLocal search feature."
#collect user input
puts "What would you like to search for?"
topic = gets.chomp
puts "That's a great topic. We love #{topic}. Now for your location, at which address would you like to center your search? (format: street address, city, state)"
address = gets.chomp
puts "That's a great area. We haven't been, but we hear it's a lovely location."
puts "Within how great of a radius would you like to see these tweets? ex: '1mi/km', '2mi/km'"  #asks for radius
radius = gets.chomp

c = Geocoder.coordinates("#{address}")

#instatiating object
result = client.search("#{topic}", {geocode:"#{c.first},#{c.last},#{radius}"}).statuses
result.each{|r| puts r.full_text}

if result.empty?
  puts "We're sorry. There are no stories about #{topic} near your location."
end
