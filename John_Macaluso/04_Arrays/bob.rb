class Bob  
   def hey(message)
      
      @message = message
      
      if silence?
         "Fine. Be that way!"
      elsif screaming?
         "Woah, chill out!"
      elsif questioning?
         "Sure."
      else
         "Whatever."
      end
      
   end

   def screaming?
      @message == @message.upcase && @message.match(/[a-zA-Z]/)
   end

   def silence?
      @message.strip.empty?
   end

   def questioning?
      @message[-1] == "?"
   end

end