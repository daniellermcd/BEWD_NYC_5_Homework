class Bob
  attr_accessor :hey
  # def initialize
  #   @hey = hey
  # end

  def hey(message)
    if message.lstrip.empty? 
      'Fine. Be that way!'
    elsif message == message.upcase
      'Woah, chill out!'
    elsif message.end_with?('?') 
        'Sure.' 
    else
      "Whatever."
    end
  end

end

#if message.match('/[^0-9][^a-zA-Z]/') 
# && message.match('/[^0-9]/')