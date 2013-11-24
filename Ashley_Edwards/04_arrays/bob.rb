class Bob
  def hey(message)
    result = ""
    if message == message.upcase
       "Woah, chill out!"
    elsif message.include?("?")
      "Sure"
    elsif message == nil
        "Fine. Be that way!"
    else 
      "Whatever."
    end
  end
end
