class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find params[:id]
  end

  def new
    @movie = Movie.new
  end

  def create
    safe_movie = params.require(:movie).permit(:title, :description, :year_released, :rating)
    @movie = Movie.create safe_movie
    if @movie.save
      redirect_to @movie, notice: "Your movie was successfully created"
    else
      render new_movie_path
    end
  end
end
