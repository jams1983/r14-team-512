class HomeController < ApplicationController

  def index
    @now_playing = Tmdb::Movie.now_playing
    @popular = Tmdb::Movie.popular
  end

  def movie_details
    @movie = Tmdb::Movie.detail(params[:movie_id])
    @movie_trailer = Tmdb::Movie.trailers(params[:movie_id]).youtube.first.try(:source)
  end

end
