require 'minitest/autorun'
require_relative 'fizz_buzz'

describe FizzBuzz do
  it "returns 'Fizz' if the number is divisible by 3" do
    fb = FizzBuzz.new
    fb.call(3).must_equal 'Fizz'
    fb.call(6).must_equal 'Fizz'
    fb.call(9).must_equal 'Fizz'
    fb.call(12).must_equal 'Fizz'
  end

  it "returns 'Buzz' if the number is divisible by 5" do
    fb = FizzBuzz.new
    fb.call(5).must_equal 'Buzz'
    fb.call(10).must_equal 'Buzz'
    fb.call(20).must_equal 'Buzz'
    fb.call(25).must_equal 'Buzz'
  end

  it "returns 'FizzBuzz' if the number is divisible by BOTH 3 and 5" do
    fb = FizzBuzz.new
    fb.call(15).must_equal 'FizzBuzz'
    fb.call(30).must_equal 'FizzBuzz'
    fb.call(45).must_equal 'FizzBuzz'
    fb.call(60).must_equal 'FizzBuzz'
  end

  it "returns the number if nothing matches" do
    fb = FizzBuzz.new
    fb.call(1).must_equal 1
    fb.call(2).must_equal 2
    fb.call(4).must_equal 4
    fb.call(7).must_equal 7
    fb.call(8).must_equal 8
  end
end
