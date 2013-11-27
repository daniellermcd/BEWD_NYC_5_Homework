class StoriesController < ApplicationController
  def index
    @stories = Story.all
  end

  def show
    @story = Story.find params[:id]
  end

  def new
    @story = Story.new
  end

  def create
    safe_story = params.require(:story).permit(:title, :category, :link)
    @story = Story.create safe_story
    if @story.save
      redirect_to @story, notice: 'Story successfully saved'
    else
      render 'new'
    end
  end
end
