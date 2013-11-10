class Fav_word
  def initialize word, count
    @word = word
    @count = count
  end

  def to_s
    puts "This legislator has said #{@word} #{@count} times."
  end

end
