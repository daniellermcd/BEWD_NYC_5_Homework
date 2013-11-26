class SearchController < ApplicationController
  def index
    query = params[:q]
    @stories = Story.search_for query
  end
end
