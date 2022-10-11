import 'package:the_movies_db_app/remote/movie_search/search_movies_api_client.dart';

import '../../data/model/movies/movies_response.dart';


class SearchMovieApi {
  final SearchMovieApiClient _apiClient;
  final String? _apiKey;

  SearchMovieApi(this._apiClient, this._apiKey);

  Future<MoviesResponse?> fetchSearchMovie(
          {int page = 1, String? query = ''}) =>
      _apiClient.fetchSearchMovie(apiKey: _apiKey, query: query, page: page);
}
