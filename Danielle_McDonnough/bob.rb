# solution to bob homework

# class Bob
#   def hey message
#     if message.strip.empty?
#       'Fine. Be that way!'
#     elsif message == message.upcase
#       'Woah, chill out!'
#     elsif message.end_with? '?'
#       'Sure.'
#     else
#       'Whatever.'
#     end
#   end
# end

# bonus tests now pass!

# class Bob
#   def hey message
#     message_contains_only_numbers = message.match(/[a-zA-Z]/).nil?
#     if message.strip.empty?
#       'Fine. Be that way!'
#     elsif (message.end_with? '?') && (message != message.upcase || message_contains_only_numbers)
#       'Sure.'
#     elsif !message_contains_only_numbers && message == message.upcase
#       'Woah, chill out!'
#     else
#       'Whatever.'
#     end
#   end
# end

# class solution

class Bob
  def hey message
    @message = message

    if screaming?
      'Woah, chill out!'
    elsif giving_the_silent_treatment?
      'Fine. Be that way!'
    elsif questioning?
      'Sure.'
    else
      'Whatever.'
    end
  end

  def questioning?
    @message.end_with? '?'
  end

  def screaming?
    @message == @message.upcase && @message =~ /[a-zA-Z]/
  end

  def giving_the_silent_treatment?
    @message.strip.empty?
  end
end
