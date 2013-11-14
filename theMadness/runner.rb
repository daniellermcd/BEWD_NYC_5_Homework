require 'rest-client'
require 'json'
require_relative 'article'

puts "Hi! What topic do you want to read about?"
query = gets.chomp
if query.strip.empty? || !query.match(/[a-zA-Z]|\d/)
  loop do
    # puts "Field is empty. Please enter a topic to search for."
    puts "Invalid search. Please try again."
    query = gets.chomp
    break unless query.strip.empty? || !query.match(/[a-zA-Z]|\d/)
    # puts "EMPTY FIELD!!"
    puts "INVALID SEARCH!"
  end
# elsif query.match(/[^abc]/)
  # elsif query.!~ (/[a-z][A-Z]\d/)
  # loop do 
  #   puts "Nothing matches your search request. Try again."
  #   query = gets.chomp
  #   # break unless query.match(/[^abc]/)
  #   break unless query.!~ (/[a-z][A-Z]\d/)
  #   puts "NO MATCHES!!"
  # end
end


# result = RestClient.get('http://www.omdbapi.com/', {params: {t: query}})
#result = RestClient.get('http://ws.spotify.com/search/1/artist.json?q=#{query}')
# result = RestClient.get('http://digg.com/api/news/new.json?q=#{query}')
#result = RestClient.get('http://digg.com/api/news/new.json')
#result = RestClient.get('http://mashable.com/stories.json?', {params: {q: query}})
# result = RestClient.get("http://mashable.com/stories.json?q=#{query}")
# http://mashable.com/search.json?page=2&q=snow&t=stories
# result = RestClient.get("http://mashable.com/stories.json?hot_per_page=2&new_per_page=20&rising_per_page=3&new_after=1vFD1t?q=#{query}")
result = RestClient.get("http://mashable.com/search.json?q=#{query}")
parsed = JSON.parse result




# parsed ["artists"].collect do |artist_name|
#   Artist.new artist_name["name"]
# end

# puts "Are any of these artists the one you were looking for?"
# puts artist_name
# end

# parsed ["data"]["feed"].collect do |article|
  # Article.new article["title"], article["description"]
  # puts "#{article["content"]["title"]} : #{article ["content"]["description"]}"

# puts "Here are some articles that might interest you:"
list = parsed["posts"].collect do |story|
  # puts "#{story["title"]} by #{story["author"]}"
  # puts "Here are some articles that might interest you:"
  Article.new story["title"], story["author"]
  # article.collect do |articles|
  #   puts "#{article["title"]} by #{article["author"]}"


end

# if query.empty?
#   loop do
#     puts "Field is empty. Please enter a topic to search for."
#     query = gets.chomp
#     break unless query.empty?
#     puts "EMPTY FIELD!!"
#   end
  # result = RestClient.get("http://mashable.com/search.json?q=#{query}")
  # parsed = JSON.parse result
  # list = parsed["posts"].collect do |story|
  #   Article.new story["title"], story["author"]
  # end
# else

# if query.empty?
#   loop do
#     puts "Field is empty. Please enter a topic to search for."
#     query = gets.chomp
#     break unless query.empty?
#     puts "EMPTY FIELD!!"
#   end
# if list.empty? 
#   puts "Nothing matches your search request."
# else
puts "Here are some articles that might interest you.  They inlclude '#{query}':"
# # article = Article.new story["title"], story["author"]
list.each do |article|
  puts article
end

