class MoviesController < ApplicationController
  def index
    @present = params[:query]
    if params[:query].present?
      @movies = Movie.where("title ILIKE ?" , "%#{params[:query]}%")
    else
      @movies = Movie.all
    end

    if params[:order] == "ASC"
      @movies = Movie.order(:title)
    elsif params[:order] == "DESC"
      @movies = Movie.order(title: :desc)
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :rating, :poster_url)
  end
end
