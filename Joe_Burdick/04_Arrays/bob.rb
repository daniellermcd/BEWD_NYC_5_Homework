class Bob 

	def hey message
		msgArray = message.split(" ")
		
		if message.strip.empty? == true
			responses[3]
		elsif message == message.upcase && message.match(/[a-zA-Z]/)
			responses[1]

			# if msgArray.last.include? "?" || "!"
			# 	responses[1]
			# else
			# 	responses[1]
			# end
		#elsif msgArray.last.include? "?"			
		elsif message[-1] == "?"
				responses[2]
		else
			responses[0]
		end 
	end

	def responses 
		@responseArray ||= ["Whatever.", "Woah, chill out!", "Sure.", "Fine. Be that way!"]
	end

end