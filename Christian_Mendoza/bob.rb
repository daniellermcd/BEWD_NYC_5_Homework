class Bob
  # response/statement mappings: http://bit.ly/171Yper 

  def hey (message)
    respond (message)
  end

  def respond (statement)
    response = ['Fine. Be that way!', 'Woah, chill out!', 'Sure.', 'Whatever.']

    @statement = statement

    if is_silent?
      response[0]
    elsif is_yelling? && has_letters?
      response[1]
    elsif is_questioning?
      response[2]
    else
      response[3]
    end
  end

  def is_silent?
    @statement.squeeze.length < 2
  end

  def is_yelling?
    @statement == @statement.upcase
  end

  def is_questioning?
    @statement.end_with? '?'
  end

  def has_letters?
    @statement.match(/[A-Z]/)
  end
end
