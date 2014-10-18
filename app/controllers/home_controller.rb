class HomeController < ApplicationController
  def index
    @popular = []
    Tmdb::Movie.popular.each do |movie|
      @popular << Movie.info(movie.id)
    end
  end
end
