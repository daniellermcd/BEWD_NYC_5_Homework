class MoviesController < ApplicationController
  before_action :find_movie, only: [:show]

  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create safe_movie
    if @movie.save
      redirect_to @movie, notice: "Your movie was successfully created"
    else
      render 'new'
    end
  end

  private

  def find_movie
    @movie = Movie.find params[:id]
  end

  def safe_movie
    params.require(:movie).permit(:title, :description, :year_released, :rating)
  end
end
