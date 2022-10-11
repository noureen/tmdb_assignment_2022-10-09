//Base Url and endpoints
class Endpoints {
  Endpoints._();

  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String imageUrl = "http://image.tmdb.org/t/p/w500";
  static const String upcomingMovie =
      'movie/upcoming?api_key={api_key}&page={page}';
  static const String movieDetail = 'movie/{movie_id}?api_key={api_key}';
  static const String movieImages = 'movie/{movie_id}/images?api_key={api_key}';
  static const String searchMovies =
      'search/movie?api_key={api_key}&query={query}&page={page}';
  static const String genre = 'genre/movie/list?api_key={api_key}';
}
