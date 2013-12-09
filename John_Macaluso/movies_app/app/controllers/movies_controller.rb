class MoviesController < ApplicationController
   before_action :find_movie, only: [:edit, :update, :show, :destroy]

   def index
      @movies = Movie.all
   end

   def new
      @movie = Movie.new
   end

   def create
      @movie = Movie.create safe_movie
      if @movie.save
         redirect_to @movie
      else
         render :new
      end
   end

   def show
   end

   def edit
   end

   def update
      @movie.update safe_movie
      if @movie.update(safe_movie)
         redirect_to @movie
      else
         render :edit
      end
   end

   def destroy
      @movie.destroy
      redirect_to @movie
   end

   private
   def find_movie
      @movie = Movie.find params[:id]
   end

   def safe_movie
      params.require(:movie).permit(:title, :description, :year_released, :rating)
   end

end