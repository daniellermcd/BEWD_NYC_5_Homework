class Bob
  def hey (message)
    respond (message)
  end

  def respond (statement)
    teen = ['Fine. Be that way!', 'Woah, chill out!', 'Sure.', 'Whatever.']

    @statement = statement

    if is_silent?
      teen[0]
    elsif is_yelling?
      if has_numbers?
        if ends_exclamation?
          teen[1]
        elsif is_questioning?
          teen[2]
        elsif has_no_punctuations?
          teen[3]
        end
      else
        teen[1]
      end
    elsif is_questioning?
      teen[2]
    else
      teen[3]
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

  def has_numbers?
    @statement.match(/\d/)
  end

  def ends_exclamation?
    @statement.end_with? '!'
  end

  def ends_period?
    @statement.end_with? '.'
  end

  def has_no_punctuations?
    !is_questioning? || !ends_exclamation? || !ends_period?
  end

  # def shouting_with_numbers?
  #   @statement.end_with '!' && @statement == @statement.upcase && @statement.to_i != 0
  # end

  # def shouting_with_no_punctuation
  #   !is_questioning? || !ends_exclamation? || !ends_period? && @statement == @statement.upcase
  # end

end