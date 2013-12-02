require_relative 'story' 
require 'JSON'
# Collecting user input
puts "Hi, welcome, you sneaky reddit search."
puts "What would you like to search for?"
# Showing stuff on the screen
query = gets.chomp
# Instantiating object
RestCient.get "reddit.com....search=#{query}"
parsed = JSON.parse result
parsed["data"]["story"].collect do |s|
	Story.new s["title"], s["description"]
end

puts "Here's a list of found articles"
stories.each do |story|
	puts story
end
 