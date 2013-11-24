class Bob
  def hey(message)
    if message.strip.empty? || message.blank?
        "Fine. Be that way!"
    elsif message == message.upcase
        "Whoa, chill out!"
    elsif message.end_with?("?")
        "Sure."
    else   
        "Whatever."
    end
  end

end