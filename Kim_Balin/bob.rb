class Bob

  RESPONSES = ['Whatever.', 'Woah, chill out!', 'Sure.', 'Fine. Be that way!']
  
  def hey(message)

    if message.strip.empty?
      RESPONSES[3]

    elsif message == message.upcase
      RESPONSES[1]

    elsif message[-1] == "?"
      RESPONSES[2]

    else
      RESPONSES[0]
    end
  end
end