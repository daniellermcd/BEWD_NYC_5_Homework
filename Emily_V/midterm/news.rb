class News
  def initialize title, url, author
    @title = title
    @url = url
    @author = author
  end
  
  # Format display of each story.
  def to_s
    "\n\tTitle:  #{@title}\n
    \tAuthor: #{@author}\n
    \tUrl: #{@url}\n\n"
  end

  # Insert current object's url into a variable accessible by Launchy
  def get_url
    @url
  end

end

# Show the news story, and ask if user wants open link or move on.
def show_story
    puts @stories[@counter]
    @link = @stories[@counter].get_url
    puts "To view this story in your browser, type OPEN\n
    To see the next story, type NEXT"
    @start = gets.chomp.downcase
    shuffle
  end

# Determine if user wants to open link or move on.
def shuffle
  if @start == "open"
    Launchy.open(@link)
    next_story
  elsif @start == "next"
    @counter += 1
    show_story
  else
    puts "Sorry, you didn't type a correct command.\n
    To view this story in your browser, type OPEN\n
    To see the next story, type NEXT"
    @start = gets.chomp.downcase
    shuffle
  end
end

# After opening link, ask if user still wants to see next story
def next_story
  puts "Would you still like to see the next story? Type NEXT"
  @start = gets.chomp.downcase
  shuffle
end
