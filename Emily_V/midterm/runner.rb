require 'json'
require 'rest-client'
require 'launchy'
require_relative 'news.rb'

# Pull the latest/top 10 stories from Hacker News
data = RestClient.get('http://api.thriftdb.com/api.hnsearch.com/items/_search?limit=10&sortby=product(points,pow(2,div(div(ms(create_ts,NOW),3600000),72)))%20desc&pretty_print=true')

# Parse using JSON
parsed = JSON.parse data

# Take out the everything not under "Results" key
results = parsed.reject { |key, value| key != "results"}

# Create array and slap the value of "Results" into it
pull_items = []
pull_items = results["results"].each do |items|
  pull_items << items
end

# Create an array and make each "Item" into its own item
pull_info = []
pull_items.each do |x|
  pull_info << x["item"]
end

# Create a new object for each news story
@stories = pull_info.map do |s|
  News.new s["title"], s["url"], s["username"]
end

# Logo and Welcome Message
puts <<STRING
  _   _            _               _   _                    
 | | | |          | |             | \\ | |                   
 | |_| | __ _  ___| | _____ _ __  |  \\| | _____      _____  
 |  _  |/ _` |/ __| |/ / _ | '__| | . ` |/ _ \\ \\ /\\ / / __| 
 | | | | (_| | (__|   |  __| |    | |\\  |  __/\\ V  V /\\__ \ 
 \\_| |_/\\__,_|\\___|_|\\_\\___|_|    \\_| \\_/\\___| \\_/\\_/ |___/ 
        Welcome to Hacker News... from the Command Line!
STRING

# View the first story
puts "\nTo see the latest post, press any key"
start = gets
@counter = 0
show_story