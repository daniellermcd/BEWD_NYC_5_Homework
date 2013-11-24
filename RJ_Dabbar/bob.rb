class Bob

  def hey phrase

    phrase_array = phrase.split(//)

  #   case phrase_array, phrase
  #   when check_ramble phrase == 2
  #     "Sure."
  #   when is_it_a_question? phrase_array
  #     if is_last_letter_capital? phrase_array
  #       if is_second_to_last_char_a_num? phrase_array
  #         "Sure."
  #       else 
  #         "Woah, chill out!"
  #       end
  #     else
  #       "Sure."
  #     end

  #   when silence? phrase_array
  #     "Fine. Be that way!"  

  #   when is_last_char_caps_and_exclamation? phrase_array
  #     "Woah, chill out!"

  #   when does_it_end_in_exclamation? phrase_array
  #     "Whatever."

  #   when check_all_numbers? phrase_array
  #     "Whatever."      

  #   when is_it_senseless_shouting? phrase_array
  #     "Woah, chill out!"

  #   else
  #     "Whatever."
  # end          

  if check_ramble(phrase) == 2
    "Sure."
  

  elsif is_it_a_question? phrase_array
    if is_last_letter_capital? phrase_array
      if is_second_to_last_char_a_num? phrase_array
        "Sure."
      else 
        "Woah, chill out!"
      end
    else
      "Sure."
    end

  elsif silence? phrase_array
    "Fine. Be that way!"
    
  elsif is_last_char_caps_and_exclamation? phrase_array
    "Woah, chill out!"

  elsif does_it_end_in_exclamation? phrase_array
    "Whatever."
  
  elsif check_all_numbers? phrase_array
    "Whatever."
    
  elsif is_it_senseless_shouting? phrase_array
    "Woah, chill out!"

  else 
    "Whatever."

  end
end

  def silence? phrase_array
    phrase_array[0] == phrase_array.last
  end

  def is_second_to_last_char_a_num? phrase_array
    phrase_array[-2].to_i != 0
  end

  def is_it_a_question? phrase_array
    phrase_array.last == "?"
  end

  def is_last_letter_capital? phrase_array
    (phrase_array[-2] == phrase_array[-2].upcase)
  end

  def is_last_char_caps_and_exclamation? phrase_array
    ((phrase_array[-2] == phrase_array[-2].upcase) && phrase_array.last == "!")
  end  

  def does_it_end_in_exclamation? phrase_array
    phrase_array.last == "!"
  end

  def is_it_senseless_shouting? phrase_array
    (phrase_array[-1] == phrase_array[-1].upcase) && (phrase_array[1] == phrase_array[1].upcase)
  end

  def check_ramble phrase
    if phrase.include?("?") && phrase.include?("!")
      2
    else  
      0
    end
  end    

  def check_all_numbers? phrase_array

    if phrase_array.last.to_i == 3
      true
    end  

  end 


 

end