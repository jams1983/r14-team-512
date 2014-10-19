class Movie < ActiveRecord::Base
  acts_as_votable

  belongs_to :group

  def details
    Tmdb::Movie.detail(self.movie_id)
  end

  def trailer
    Tmdb::Movie.trailers(self.movie_id).youtube.first.try(:source)
  end
end
