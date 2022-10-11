

import '../../data/model/movies/movies_response.dart';

abstract class MoviesInterface {
  Future<MoviesResponse?> fetchUpcomingMovies({int page=1});
}
