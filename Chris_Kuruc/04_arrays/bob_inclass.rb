class Bob

  def hey talk

    if talk.split.empty?
      response = "Fine. Be that way!"
    elsif talk.upcase == talk && talk.split(//).select { |element| element =~ /[[:alpha:]]/ }.size > 0
      response = "Woah, chill out!"
    elsif talk[-1] == "?"
      response = "Sure."
    else
      response = "Whatever."
    end

    response

  end
end