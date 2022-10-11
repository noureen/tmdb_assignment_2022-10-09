

import '../../data/model/movies/movies_response.dart';

abstract class SearchMovieInterface {
  Future<MoviesResponse?> fetchSearchMovie({int page=1,String? query = ''});
}
