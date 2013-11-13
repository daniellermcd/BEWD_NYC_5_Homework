require_relative 'article'
require 'json'
require 'rest-client'

puts "Welcome to Mashable articles"
puts "What article would you like to find?"

query = gets.chomp

result = RestClient.get "http://mashable.com/search.json?q=#{query}"
parsed = JSON.parse result

parsed["posts"].each do |story|
  
  puts "Title: #{story["title"]}, Blurb: #{story["excerpt"]}"
end