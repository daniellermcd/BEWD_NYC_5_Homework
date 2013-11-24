module ResponseTypes

  def silent? teenager
   teenager.strip.empty?
  end

  def yell? teenager
    teenager == teenager.upcase
  end

  def question? teenager
    teenager.end_with? "?"
  end
  
  def numbers? teenager
  Float self != nil rescue false
  end

end