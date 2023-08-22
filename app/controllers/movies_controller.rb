class MoviesController < ApplicationController
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: 'movie was succesfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: 'movie was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movie_url, notice: 'movie was successfully destroyed'
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end
end
