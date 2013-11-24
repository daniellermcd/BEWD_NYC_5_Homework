require_relative 'response_types'

# SOLUTION #1

# class Bob
# def hey message
  
#   if message.length <= 5 || message.empty?
#     "Fine. Be that way!"
#   elsif message == message.upcase
#     "Woah, chill out!"
#   elsif message.end_with? "?"
#     "Sure."
#   elsif message.end_with? "!"
#     'Whatever.'
#   elsif message.include? "?"
#     'Whatever.'        
#   else
#     "Whatever." 
#   end  
# end
# end


#SOLUTION NUMBER 2
# Module ResponseTypes in response_types.rb

class Bob
  include ResponseTypes
  def hey message
    respond (message)
  end

  def respond teenager
    response = ["Fine. Be that way!", "Woah, chill out!", "Sure.", "Whatever."]
    if silent? (teenager)
      response[0]
    elsif yell? (teenager)
      response[1]
    elsif question? (teenager)
      response[2]
    elsif numbers? (teenager)
      response[3]
    else
      response[3]
    end
  end
end



#WORK IN PROGRESS
# SOLUTION 3 

# class Bob
#   include ResponseTypes
#     def hey message
#   case
#   when message.length <= 5 && message.empty? then "Fine. Be that way!"
#   when message == message.upcase then "Woah, chill out!"
#   when message.include? "?" then "Whatever."
#   when message.numbers? then "Sure."
#   else
#     "Sure."
#     end
#     end
#   end
