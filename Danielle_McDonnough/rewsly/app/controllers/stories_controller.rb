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
    story = Story.create safe_story
    redirect_to story
  end
end
