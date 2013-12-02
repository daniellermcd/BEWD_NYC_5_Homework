require 'rest-client'
require 'json'
require_relative 'article'

puts "Hi! What topic do you want to read about?"
query = gets.chomp
if query.strip.empty? || !query.match(/[a-zA-Z]|\d/)
  loop do
    puts "Invalid search. Please try again."
    query = gets.chomp
    break unless query.strip.empty? || !query.match(/[a-zA-Z]|\d/)
    puts "INVALID SEARCH!"
  end
end

result = RestClient.get("http://mashable.com/search.json?q=#{query}")
parsed = JSON.parse result

list = parsed["posts"].collect do |story|
  Article.new story["title"], story["author"]
end

puts "Here are some articles that might interest you.  They inlclude '#{query}':"
list.each do |article|
  puts article
end

