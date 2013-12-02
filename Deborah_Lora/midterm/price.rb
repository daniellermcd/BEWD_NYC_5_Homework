require 'rest-client'
require 'json'

class Price 
	attr_accessor :type
	def initialize type
		@type = type
	end

	def api_call
		result = RestClient.get "https://api.coindesk.com/v1/bpi/currentprice.json"
		@parsed = JSON.parse result 
	end

	def to_s
		"#{@parsed["bpi"][type]["rate_float"]} #{@parsed["bpi"][type]["code"]}"
	end
end
