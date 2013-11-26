=begin

class FizzBuzz
  def call number
    if number % 3 == 0 && number % 5 == 0
      "FizzBuzz"
    elsif number % 3 == 0
      "Fizz"
    elsif number % 5 == 0
      "Buzz"
    else
      number 
    end
  end
end

=end


=begin

class FizzBuzz
  def call number
    if (number % 15).zero?
      "FizzBuzz"
    elsif (number % 3).zero?
      "Fizz"
    elsif (number % 5).zero?
      "Buzz"
    else
      number
    end
  end
end
  
=end   

class FizzBuzz
  def call number
    result = ''
    if (number % 3).zero?
      result << "Fizz"
    end
    if (number % 5).zero?
      result << "Buzz"
    end
    if result.empty?
      number
    else
      result
    end
  end
end