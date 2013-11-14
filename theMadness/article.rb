class Article
  # attr_reader :title, :author
  def initialize title, author
    @title = title
    @author = author
  end
  
  #   def search
  #   query = params[:query].strip.split if params[:query]
  #   like = "quote LIKE "
  #   conditions = ""
  #   query.each do |word|
  #       conditions += (like + "'%#{word}%'")
  #       conditions += " AND " unless query.last == word
  #   end
  #   @quotes = Quote.all(:conditions => conditions)
  # end

  def to_s
    "#{@title} by #{@author}"
  end
 

end

# puts "Here are some articles that might interest you:"
# puts "#{@title} by #{@author}"