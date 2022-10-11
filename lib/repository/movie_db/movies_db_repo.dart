import 'package:the_movies_db_app/data/database/dao/genres_dao.dart';
import 'package:the_movies_db_app/data/database/dao/movie_detail_dao.dart';
import 'package:the_movies_db_app/data/model/movie_detail/movie_detail.dart';

import 'package:the_movies_db_app/data/model/movie_images/movies_images.dart';

import '../../data/database/app_db.dart';
import '../../data/database/dao/movies_dao.dart';
import '../../data/database/utils/data_mapper.dart';
import '../../data/model/movie_detail/genres.dart';
import '../../data/model/movies/movies_model.dart';
import '../../di/component/locator.dart';

part 'movies_db_interface.dart';

class MoviesDbRepo implements MoviesDbRepoInterface {
  late final MoviesDao _moviesDao;
  late final MovieDetailDao _movieDetailDao;
  late final GenresDao _genresDao;

  MoviesDbRepo()
      : _moviesDao = MoviesDao(locator.get()),
        _movieDetailDao = MovieDetailDao(locator.get()),
        _genresDao = GenresDao(locator.get());

  //Movies
  @override
  Future<List<MoviesEntityData>?> getMovies() async {
    final result = await _moviesDao.getMovies();
    return result;
  }

  @override
  Future<List<MoviesEntityData>?> getMoviesPaginated({
    required int limit,
    required int offset,
  }) async {
    List<MoviesEntityData>? list = [];
    list = await _moviesDao.getMoviesPaginated(offset: offset, limit: limit);

    return list;
  }

  @override
  Future<int> insertMovies({required int id, MoviesModel? movie}) async {
    int result = await _moviesDao
        .insertMoviesDao(DataMapper.insertMapMovie(id: id, movie: movie));
    return result;
  }

  //Genre

  @override
  Future<int> insertGenre({required int id, Genres? genre}) async {
    int result = await _genresDao
        .insertGenresDao(DataMapper.insertMapGenre(id: id, genre: genre));
    return result;
  }

  @override
  Future<List<GenresEntityData>?> getGenres() async {
    final result = await _genresDao.getGenres();
    return result;
  }

  //MoviesDetail
  @override
  Future<int> insertMovieDetail({required int id, MovieDetail? movie}) async {
    int result = await _movieDetailDao.insertMovieDetail(
        DataMapper.insertMapMovieDetail(id: id, movieDetail: movie));
    return result;
  }

  @override
  Future<int> insertMovieImages({required int id, MoviesImages? movie}) async {
    int result = await _movieDetailDao.insertMovieDetail(
        DataMapper.insertMapMovieImages(id: id, movieImages: movie));
    return result;
  }

  @override
  Future<MovieDetailEntityData?> getMovieDetail({required int? movieId}) async {
    final result = await _movieDetailDao.getMovieDetail(movieId);
    return result;
  }
}
