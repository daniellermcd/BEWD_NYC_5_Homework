class Bob
 
  def hey(greeting)
 
    reactions = ["Whatever.", "Fine. Be that way!", "Sure.", "Woah, chill out!"]
 
    if greeting.strip.empty?     
      reactions[1]
    elsif greeting == greeting.upcase && greeting.match(/[a-zA-Z]/)
      reactions[3]
    elsif greeting[-1] == "?"
      reactions[2]
    else
      reactions[0]
    end
 
  end
end