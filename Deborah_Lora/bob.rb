class Bob

	def hey(response)
		if response.empty? || response.strip.empty?
			"Fine. Be that way!"
		elsif (response.match(/[?]\z/) && response != response.upcase) ||
					(response.match(/[?]\z/) && response.match(/[a-zA-Z]/).nil?)
			"Sure."
		elsif response == response.upcase && response.match(/[a-zA-Z]/).nil? == false
			"Woah, chill out!"
		else
			 "Whatever."
		end
	end
end
