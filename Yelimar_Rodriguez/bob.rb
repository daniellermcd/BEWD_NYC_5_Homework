require_relative 'bob'

class Bob
  def hey(message)

    if message == message.upcase && !message.strip.empty?
      'Woah, chill out!'
    elsif message.end_with?('?') && message != message.upcase
      'Sure.'
    elsif message.strip.empty?
      'Fine. Be that way!'
    else message
      'Whatever.'
    end
  end
end



        
    # any message = 'Whatever.'
    # screaming: ends with ! = 'Whatever.'
    # shouting: is UPPERCASE = 'Woah, chill out!'
    # forceful_questions: UPPERCASE? = 'Woah, chill out!'
    # questions: end with ? = 'Sure.'
    # silence: '' = 'Fine. Be that way!'
    # prolonged silence '    ' = 'Fine. Be that way!'


