class Article
  attr_accessor :title, :blurb
  def initialize title, blurb
    @title = title
    @blurb = blurb
  end

  # def mashable_call
  #   result = RestClient.get "http://mashable.com/search.json?q=#{}"
  #   parsed = JSON.parse result
  # end

  def to_s
    "Title: #{@title}\nBlurb: #{@blurb}"
  end
end

# new_article = Article.new "Twitter IPOS", "sakfhaslkfhklas"

# new_article.title #=> "Twitter IPOS"

# new_article.blurb #=> "sadfhalsfasf"

# new_article.title = "Twitter makes more money now"

# new_article.title #=> "Twitter makes more money now"