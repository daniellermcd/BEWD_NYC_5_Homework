require_relative 'fizz_buzz'

=begin
1.upto(100) do |number|
  puts FizzBuzz.new.call(number) # same as fb = FizzBuzz.new \n puts fb.call(number)
end
=end

1.upto(100) do |number|
  fb = FizzBuzz.new
  puts "the resuly for #{number} is #{fb.call(number)}"
end