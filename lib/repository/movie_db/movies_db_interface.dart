part of '../movie_db/movies_db_repo.dart';

abstract class MoviesDbRepoInterface {
  //Movies
  Future<int> insertMovies({required int id, MoviesModel? movie});

  Future<List<MoviesEntityData>?> getMovies();

  Future<List<MoviesEntityData>?> getMoviesPaginated({
    required int limit,
    required int offset,
  });

  //MoviesDetail

  Future<int> insertMovieDetail({required int id, MovieDetail? movie});

  Future<int> insertMovieImages({required int id, MoviesImages? movie});

  Future<MovieDetailEntityData?> getMovieDetail({required int? movieId});

  Future<int> insertMovieVideos({required int id, MovieVideoResponse? movie});

  //Genre

  Future<int> insertGenre({required int id, Genres? genre});

  Future<List<GenresEntityData>?> getGenres();
}
