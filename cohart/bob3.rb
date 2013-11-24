# class Bob
#   def hey(message)
#     if message === message.upcase && !message.strip.empty? && message =~ /[a-zA-Z]/#this means it's not empty... 
#       #these checks/progressions need to happen logically.
#       'Woah, chill out!'
#     elsif message.strip.empty?
#       'Fine. Be that way!'
#     elsif message.end_with? '?'
#       'Sure.'
#     else 
#       "Whatever."
#     end
#   end
# end


class Bob
  def hey(message)
    @message = message
    
    if screaming?
      'Woah, chill out!'
    elsif giving_silent_treatment?
      'Fine. Be that way!'
    elsif questioning? '?'
      'Sure.'
    else 
      "Whatever."
    end
  end

  def screaming?
    @message === message.upcase && message =~ /[a-zA-Z]/
  end

  def giving_silent_treatment?
    @message.strip.empty?
  end

  def questioning?
    @message.end_with? '?'
  end
end






