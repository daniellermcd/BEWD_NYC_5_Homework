class Article
  def initialize title, blurb
    @title = title
    @blurb = blurb
  end

  def to_s
    puts "Title: #{@title}"
    puts "Blurb: #{@blurb}"
  end