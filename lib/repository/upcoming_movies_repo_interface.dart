import '../data/model/upcoming_movies/upcoming_movies_response.dart';

abstract class UpcomingMoviesInterface {
  Future<UpcomingMoviesResponse?> fetchUpcomingMovies({int page=1});
}
