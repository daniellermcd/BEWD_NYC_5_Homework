class Story
   def initialize title, author, content
      @title = title
      @author = author
      @content = content
   end

   def to_s
      puts "Author: #{@author}"
      puts "Title: #{@title}"
      puts "#{@content}"
   end
end