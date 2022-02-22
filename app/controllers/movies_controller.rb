class MoviesController < ApplicationController
  def index
    if params[:query].present?
      @moviess = Movie.where("name ILIKE ?","%#{params[:query]}%")
    else
      @movies = Movie.all
    end
  end
end
