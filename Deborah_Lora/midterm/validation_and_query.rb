module ValidationAndQuery
	def validate query=gets.chomp
		currency_options = ['USD', 'EUR', 'GBP']
		query = query.gsub(/[^a-zA-Z]/, '').upcase #controls for punctuation and lowercase characters
		if currency_options.include? query
			query
		else
			puts "You've entered an incorrect input. Enter one of the following: 'USD' (For price in U.S Dollars), 'EUR' (For price in Euro), 'GBP' (For Great Britsh Pound)."
			validate 
		end
	end
end
