class Bob
  def hey(message)
    @message = message
    
    if screaming?
       "Woah, chill out!"
    elsif giving_silent_treatment?
        "Sure"
    elsif questioning?
        "Fine. Be that way!"
    else 
        "Whatever."
    end
  end

  def screaming?
    @message == @message.upcase && !message.strip.empty? && message =~ /[a-zA-Z]/
  end

  def giving_silent_treatment?
    @message.strip.empty?
  end 

  def questioning?
    @messange.end_with? "?"
  end
end

