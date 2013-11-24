class Bob
  def hey(message)
    response = ['Fine. Be that way!', 'Woah, chill out!', 'Sure.', 'Whatever.']
      if is_silent?(message)
        response[0]    
      elsif is_yelling?(message)
        response[1]
      elsif is_question?(message)
        response[2]  
      else
        response[3]
      end
  end

  def is_question?(message)
    message.end_with? '?'
  end

  def is_yelling?(message)
    message == message.upcase
  end

  def is_silent?(message)
    message.squeeze.length < 2
  end
end