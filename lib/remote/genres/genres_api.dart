
import '../../data/model/genre/genre_response.dart';
import 'genres_api_client.dart';

class GenresApi {
  final GenresApiClient _apiClient;
  final String? _apiKey;

  GenresApi(this._apiClient, this._apiKey);

  Future<GenreResponse?> fetchGenres() =>
      _apiClient.fetchGenres(apiKey: _apiKey);
}
