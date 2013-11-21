require_relative 'story'

# collecting user input
puts "hi...."
puts "what do you want to search for?"
# showing stuff on the screen
query = gets.chomp
# instantiating object
result = RestClient.get "reddit.com....?search=#{query}"
parsed = JSON.parse result
stories = parsed["data"]["story"].collect.do |s|
  Story.new s["titles"], s["description"]
end

puts "here's a list of found articles"
stories.each do |story|
  puts story
end