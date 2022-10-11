import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:the_movies_db_app/data/model/genre/genre_response.dart';
import '../../constants/endpoints.dart';
import '../../data/model/movies/movies_response.dart';

part 'genres_api_client.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class GenresApiClient {
  factory GenresApiClient(Dio dio, {String baseUrl}) = _GenresApiClient;

  @GET(Endpoints.genre)
  Future<GenreResponse?> fetchGenres(
      {@Path("api_key") required String? apiKey});
}
