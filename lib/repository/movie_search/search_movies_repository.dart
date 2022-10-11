import 'package:the_movies_db_app/repository/movie_search/search_movies_repo_interface.dart';
import '../../data/model/movies/movies_response.dart';
import '../../remote/movie_search/search_movies_api.dart';

class SearchMovieRepository implements SearchMovieInterface {
  final SearchMovieApi _api;

  SearchMovieRepository(this._api);

  @override
  Future<MoviesResponse?> fetchSearchMovie({int page = 1, String? query = ''}) {
    return _api
        .fetchSearchMovie(page: page, query: query)
        .then((value) => value);
  }
}
