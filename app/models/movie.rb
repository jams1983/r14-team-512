class Movie
  include ActiveModel::Model

  attr_accessor :id, :title, :genres, :images, :poster_path, :overview, :popularity, :trailer, :vote_average, :release_date

  def self.info(movie_id)
    movie = Tmdb::Movie.detail(movie_id)
    Movie.new(
      id: movie.id,
      title: movie.original_title,
      overview: movie.overview,
      genres: movie.genres.map(&:name),
      trailer: Tmdb::Movie.trailers(movie.id).youtube.map(&:source).first,
      images: Tmdb::Movie.images(movie.id).posters.map(&:file_path),
      poster_path: movie.poster_path,
      popularity: movie.popularity,
      vote_average: movie.vote_average,
      release_date: movie.release_date
    )
  end

end