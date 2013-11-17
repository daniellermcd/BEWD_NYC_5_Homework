class Bob
	def hey(message)
		messageArr = message.split(' ')
		lastChar = message.split('').last
		messageNumArr = message.split(', ') #array
		messageStr = messageNumArr.join('') #string
		messagePop = message.split('')
		messagePop.pop
		messageStrPop = messagePop.join('')

		if(lastChar == '?' && messageStrPop.to_i.to_s == messageStrPop)
			"Sure."
		elsif(messageStr.to_i.to_s == messageStr)
			"Whatever."
		elsif(messageArr.length > 0)
			if(message == message.upcase)
				"Woah, chill out!"
			elsif(lastChar == '?')
				"Sure."
			elsif(lastChar == '!')
				"Whatever."
			else
				"Whatever."
			end
		else
			"Fine. Be that way!"
		end
	end
end