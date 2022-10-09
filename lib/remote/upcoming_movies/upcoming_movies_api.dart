import 'package:the_movies_db_app/remote/upcoming_movies/upcoming_movies_api_client.dart';

import '../../data/model/upcoming_movies/upcoming_movies_response.dart';

class UpcomingMoviesApi  {
  final UpcomingMoviesApiClient _apiClient;
  final String? _apiKey;

  UpcomingMoviesApi(this._apiClient,this._apiKey);

  Future<UpcomingMoviesResponse?> fetchUpcomingMovies({int page=1}) => _apiClient.fetchUpcomingMovies(apiKey: _apiKey);

}
