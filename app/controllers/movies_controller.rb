class MoviesController < ApplicationController
  before_action :set_movie_group
  def vote
    @movie.liked_by current_user
  end

  def unvote
    @movie.unliked_by current_user
  end

  protected
    def set_movie_group
      @group = Group.find(params[:group_id])
      @movie = @group.movies.find(params[:movie_id])
    end
end