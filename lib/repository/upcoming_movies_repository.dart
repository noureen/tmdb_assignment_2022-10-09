import 'package:the_movies_db_app/repository/upcoming_movies_repo_interface.dart';
import '../data/model/upcoming_movies/upcoming_movies_response.dart';
import '../remote/upcoming_movies/upcoming_movies_api.dart';

class UpcomingMoviesRepository implements UpcomingMoviesInterface{
  final UpcomingMoviesApi _api;

  UpcomingMoviesRepository(this._api);

  @override
  Future<UpcomingMoviesResponse?> fetchUpcomingMovies({int page=1}) {
    return _api.fetchUpcomingMovies(page: page).then((value) => value);
  }
}