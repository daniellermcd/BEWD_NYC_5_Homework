class MoviesController < ApplicationController
  def index
    @movies = Movie.all  
  end

  def new
    @movie = Movie.new
  end

  def create
    new_movie = params.require(:movie).permit(:title, :description, :year_released)
    movie = Movie.create new_movie
  end 

  def show
  end

  def edit
  end

  def update
    @movie.update new_movie
    redirect_to @shirt 
  end

  private

  def find_movie
    @movie = Movie.find params[:id]
  end 


end