class Bob
  def hey(message)
    if message.strip.empty?
      "Fine. Be that way!"
    elsif !message[/[a-z]/] && message[/[A-Z]/]
      "Woah, chill out!"
    elsif message[-1] == '?'
      "Sure."
    else
      "Whatever."
    end
  end

end