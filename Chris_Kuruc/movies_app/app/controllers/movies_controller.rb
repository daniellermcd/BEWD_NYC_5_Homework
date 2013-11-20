class MoviesController < ApplicationController

  def index
    @movie_data = Movie.all
  end

end
