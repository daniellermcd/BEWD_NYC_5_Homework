require 'minitest/autorun'

class Story
  def initialize title, category, upvotes
    @title = title
    @category = category
    @upvotes = upvotes
  end

  def upvotes
    upvotes = 1
  end

  def upvote_downvote
    upvote = upvotes + 1
    downvote = upvotes - 1
  end

end

## I do not understand how to write to pass the third test


### Write your code above the tests ###
describe Story do 
  it "requires a title and a category on initialization" do
    story = Story.new "Wombat sees dentist after 10 year hiatus", "Nature"
    story.title.must_equal "Wombat sees dentist after 10 year hiatus"
    story.category.must_equal "Nature"
  end

  it "has its upvotes set to 1 by default" do
    story = Story.new "Wombat sees dentist after 10 year hiatus", "Nature"
    story.upvotes.must_equal  1
  end

  it "can be upvoted and downvoted" do
    story = Story.new "Wombat sees dentist after 10 year hiatus", "Nature"
    story.upvote
    story.upvotes.must_equal 2

    story.downvote
    story.upvotes.must_equal 1
  end
end
