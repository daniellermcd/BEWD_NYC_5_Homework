require_relative 'articleMashable'
require 'json'
require 'rest-client'

puts "Welcome to Mashable articles"
puts "What article would you like to find?"

query = gets.chomp

result = RestClient.get "http://mashable.com/search.json?q=#{query}"
parsed = JSON.parse result

parsed["posts"].each do |story|
  article = Article.new story["title"], story["excerpt"]
  puts article
	# puts "Title: #{story["title"]}, Blurb: #{story["excerpt"]}"
end
