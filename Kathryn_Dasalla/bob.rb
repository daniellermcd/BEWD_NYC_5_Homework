class Bob
  def hey message
    if message.strip.empty?
      "Fine. Be that way!"
    elsif message == message.upcase && message.match(/[a-zA-Z]/)
      "Woah, chill out!"
    elsif message[-1] == "?"
      "Sure."
    else
      "Whatever."
    end
  end
end