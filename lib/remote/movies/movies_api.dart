

import '../../data/model/movies/movies_response.dart';
import 'movies_api_client.dart';

class MoviesApi {
  final MoviesApiClient _apiClient;
  final String? _apiKey;

  MoviesApi(this._apiClient, this._apiKey);

  Future<MoviesResponse?> fetchUpcomingMovies({int page = 1}) =>
      _apiClient.fetchUpcomingMovies(apiKey: _apiKey, page: page);
}
