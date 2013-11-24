# Version 03 - responds to all tests - impoved as no duplicates of outputs required.
# Only one more condition required

class Bob
  def hey(message)
    message = message.tr("\n","")
    if message =="" || message.include?("  ")
      "Fine. Be that way!"
    else
      if !/[a-z]/.match(message) && /[A-Z]/.match(message) 
      "Woah, chill out!"
    else
      if message[-1,1].eql?("?")
        "Sure."
      else
        "Whatever."
      end
    end
  end
end
end

# Version 02 - responds to all tests beside bonuses - fails bonuses / impoved as no duplicates of outputs required.
# class Bob
#   def hey(message)
#     message = message.tr("\n","")
#     if message =="" || message.include?("  ")
#       "Fine. Be that way!"
#     else
#       if !/[a-z]/.match(message)
#       "Woah, chill out!"
#     else
#       if message[-1,1].eql?("?")
#         "Sure."
#       else
#         "Whatever."
#       end
#     end
#   end
# end
# end


# Version 01 Not very elegant but functioning version - I will try to make it look prettier and maybe more readable.
# class Bob
#   def hey(message)
#     message = message.tr("\n","")
#     if message =="" || message.include?("  ")
#       "Fine. Be that way!"
#     else
    
#     if message.include?("!") && message.include?("?")
#       "Sure."
#     else
    
#    if message[-1,1].eql?("!")
#       if /\d/.match(message[1..-1]) || /\W/.match(message[1..-1]) 
#         if message.include?("'")
#           "Whatever."
#         else
#         "Woah, chill out!"
#       end
#       else
#         "Whatever."
#       end
#     elsif message[-1,1].eql?("?")
#       if message[-2,1].downcase!
#         "Woah, chill out!"
#       else
#         "Sure."
#       end
#     elsif /[A-Z][A-Z][A-Z][A-Z]/.match(message[1..-1])
#       "Woah, chill out!"
#     else
#     "Whatever."
#   end
# end
# end
# end
# end