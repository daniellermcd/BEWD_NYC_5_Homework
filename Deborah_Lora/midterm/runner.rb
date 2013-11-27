require_relative 'price'
require_relative 'validation_and_query'
include ValidationAndQuery
puts "Welcome to Bitcoin Terminal, where you can find out the current price of Bitcoin."
puts "Enter one of the following: 'USD'(For price in U.S Dollars), 'EUR' (For price in Euro), 'GBP' (For Great Britsh Pound)." 
query = ValidationAndQuery::validate 
new_price = Price.new query
# Instantiating object 
new_price.api_call
puts new_price