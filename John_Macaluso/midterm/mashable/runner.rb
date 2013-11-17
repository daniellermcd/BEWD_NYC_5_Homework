require 'rest-client'
require 'json'
require_relative 'story'

puts "Search for something on mashable:"
query = gets.chomp

mashable = RestClient.get("http://mashable.com/search.json", {params: {q: query}})
mashable_parsed = JSON.parse mashable

stories = mashable_parsed["posts"].collect do |story|
   Story.new story["title"], story["author"], story["content"]["plain"]
end

while stories.empty?
   puts "Sorry there are no stories related to your search"
   puts "Please try again:"
   
   query = gets.chomp
   
   mashable = RestClient.get("http://mashable.com/search.json", {params: {q: query}})
   mashable_parsed = JSON.parse mashable

   stories = mashable_parsed["posts"].collect do |story|
      Story.new story["title"], story["author"], story["content"]["plain"]
   end

   puts "Search Results:"
   stories.each do |story|
      puts story
   end
end

puts "Search Results:"
   stories.each do |story|
   puts story
end