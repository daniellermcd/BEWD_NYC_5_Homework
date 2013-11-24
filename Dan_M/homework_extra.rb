require 'minitest/autorun'
class Story 
# attr_reader :title, :category, :upvotes

def initialize title, category
@title = title
@category = category
end
def attr_accesor :category :upvotes
@upvotes = 1
def upvote
  @upvotes = upvotes + 1
end

def downvote
  @upvotes = upvotes - 1

end
end

#sdfkgm;
### Write your code above the tests ###
describe Story do 
  it "requires a title and a category on initialization" do
    Story = Story.new "Wombat sees dentist after 10 year hiatus", "Nature"
    Story.title.must_equal "Wombat sees dentist after 10 year hiatus"
    story.category.must_equal "Nature"
  end

  it "has its upvotes set to 1 by default" do
    Story = Story.new "Wombat sees dentist after 10 year hiatus", "Nature"
    Story.upvotes.must_equal  1
  end

  it "can be upvoted and downvoted" do
    Story = Story.new "Wombat sees dentist after 10 year hiatus", "Nature"
    Story.upvote
    Story.upvotes.must_equal 2

    Story.downvote
    Story.upvotes.must_equal 1
  end
end
