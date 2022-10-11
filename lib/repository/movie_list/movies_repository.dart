import '../../data/model/movies/movies_response.dart';
import '../../remote/movies/movies_api.dart';
import 'movies_repo_interface.dart';

class MoviesRepository implements MoviesInterface {
  final MoviesApi _api;

  MoviesRepository(this._api);

  @override
  Future<MoviesResponse?> fetchUpcomingMovies({int page = 1}) {
    return _api.fetchUpcomingMovies(page: page).then((value) => value);
  }
}
