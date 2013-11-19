class Article
  def initialize title, author
    @title = title
    @author = author
  end
  
  def to_s
    "#{@title} by #{@author}"
  end
end
