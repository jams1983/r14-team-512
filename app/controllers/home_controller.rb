class HomeController < ApplicationController

  def index
    @upcoming = Tmdb::Movie.upcoming
    @popular = Tmdb::Movie.popular
    @genres = Tmdb::Genre.list.genres.map{ |g| [ g.name, g.id ] }
    if current_user
      @group = current_user.groups.build
    end
  end

  def movie_details
    @movie = Tmdb::Movie.detail(params[:movie_id])
    @movie_trailer = Tmdb::Movie.trailers(params[:movie_id]).youtube.first.try(:source)
  end

end
