
import '../data/database/dao/movies_dao.dart';
import '../data/database/utils/data_mapper.dart';
import '../data/model/upcoming_movies/upcoming_movies_model.dart';
import '../di/component/locator.dart';
import 'movies_db_interface.dart';

class MoviesDbRepo implements MoviesDbRepoInterface {
  late final MoviesDao _moviesDao;

  MoviesDbRepo() : _moviesDao = MoviesDao(locator.get());

  @override
  Future<int> insertMovies(
      {required int id, UpcomingMoviesModel? movie}) async {
    int result = await _moviesDao
        .insertMoviesDao(DataMapper.insertMapMovie(id: id, movie: movie));
    return result;
  }
}
