class SearchController < ApplicationController
  def index
    @movies = Tmdb::Movie.find(params[:query])
  end

  def params_search
    params.required(:search).permit(:genre, :query)
  end

end
