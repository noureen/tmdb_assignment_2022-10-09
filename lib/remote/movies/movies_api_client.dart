import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../constants/endpoints.dart';
import '../../data/model/movies/movies_response.dart';

part 'movies_api_client.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class MoviesApiClient {
  factory MoviesApiClient(Dio dio, {String baseUrl}) = _MoviesApiClient;

  @GET(Endpoints.upcomingMovie)
  Future<MoviesResponse?> fetchUpcomingMovies(
      {@Path("api_key") required String? apiKey,
      @Path("page") required int? page});
}
