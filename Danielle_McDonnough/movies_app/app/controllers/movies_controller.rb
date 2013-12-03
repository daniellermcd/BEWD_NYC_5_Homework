class MoviesController < ApplicationController
  before_action :find_movie, only: [:show]

  # before running the new action, authenticate that the user is logged in
  before_action :authenticate_user!, only: [:new, :create]

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
      redirect_to @movie
      flash[:notice] = "Your movie was successfully created"
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
