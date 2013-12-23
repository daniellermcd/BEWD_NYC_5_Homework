#Finds top phrases said by legislators on congressional record
#In order to use this tool, you must know the legislator's bioguide id

require 'rest-client'
require 'sunlight'
require_relative 'fav_word'

puts "Ready to find out your legislator's favorite words?"
puts "Start by looking up your legislator's bio guide ID on this website http://bioguide.congress.gov/biosearch/biosearch.asp"
puts "After you on are the page of your selected legislator, the bioguide ID is the 6 digits in the url after the index= "
puts "What is the bio guide id of the legislator you would like to look up?"
bioguide_id = gets.chomp
puts "What is your API key?"
api_key = gets.chomp


result = RestClient.get("http://capitolwords.org/api/1/phrases.json?entity_type=legislator&entity_value=#{bioguide_id}&sort=count+desc&apikey=#{api_key}")
parsed = JSON.parse result
fav_words = parsed.collect do |word|
  Fav_word.new word["ngram"], word["count"]
end

puts "Here is a list of their favorite words"
fav_words.each do |s|
puts s
end

