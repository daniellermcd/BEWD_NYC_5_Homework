class Bob
  def hey(message)
    if message == message.upcase && !message.strip.empty? && message =~ /[a-zA-Z]/
    	'Woah, chill out!'
    elsif message.strip.empty?
    	'Fine.  Be that way!'
    elsif  message.end_with '?'
		'Sure.'   
    else
    	'Whatever.'
 end
end

