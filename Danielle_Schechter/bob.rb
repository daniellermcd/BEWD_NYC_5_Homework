class Bob
	RESPONSES = ["Whatever.", "Sure.", "Woah, chill out!", "Fine. Be that way!"]

  def hey(message)
    

    if message.strip.empty? 
    	RESPONSES[3]

    elsif message == message.upcase && message.match(/[a-zA-Z]/)
    	RESPONSES[2]

    elsif message[-1] == "?"
    	RESPONSES[1]

	else 
		RESPONSES[0]

		 
		
		end
  	end
end