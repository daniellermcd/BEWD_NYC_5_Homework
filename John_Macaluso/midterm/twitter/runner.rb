require "twitter"

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV['TWITTERCONSUMERKEY']
  config.consumer_secret     = ENV['TWITTERCONSUMERSECRET']
  config.access_token        = ENV['TWITTERACCESSTOKEN']
  config.access_token_secret = ENV['TWITTERACCESSTOKENSECRET']
end

puts "Enter a topic to start streaming..."
topics = gets.chomp
client.filter(:track => topics) do |tweet|
   puts tweet.text
end
