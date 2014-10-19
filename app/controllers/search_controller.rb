class SearchController < ApplicationController
  def index
    @now_playing = []
    search_results = Tmdb::Movie.find(params[:query])
    search_results.each do |movie|
      @now_playing = Movie.info(movie.id)
    end
  end

  def params_search
    params.required(:search).permit(:query)
  end

end
