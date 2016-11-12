class MoviesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    redirect_to '/'
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to '/'
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Película eliminada correctamente"
    redirect_to '/'
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :rating, :review, :avatar)
  end
end
