class Story
   def initialize title, author, content
      @title = title
      @author = author
      @content = content
   end

   def to_s
      "Author: #{author}\n" +
      "Title: #{title}\n" +
      "#{content}\n"
   end

   # you can only call a private method from inside the Class
   private
   attr_reader :author, :title, :content

end