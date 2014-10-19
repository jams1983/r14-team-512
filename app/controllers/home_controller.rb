class HomeController < ApplicationController

  def index
    @now_playing = Tmdb::Movie.now_playing
    @popular = Tmdb::Movie.popular
    if current_user
      @group = current_user.groups.build
    end
  end

  def movie_details
    @movie = Tmdb::Movie.detail(params[:movie_id])
    @movie_trailer = Tmdb::Movie.trailers(params[:movie_id]).youtube.first.try(:source)
  end

end
