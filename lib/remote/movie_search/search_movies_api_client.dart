import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../constants/endpoints.dart';
import '../../data/model/movies/movies_response.dart';

part 'search_movies_api_client.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class SearchMovieApiClient {
  factory SearchMovieApiClient(Dio dio, {String baseUrl}) =
      _SearchMovieApiClient;

  @GET(Endpoints.searchMovies)
  Future<MoviesResponse?> fetchSearchMovie(
      {@Path("api_key") required String? apiKey,
      @Path("query") required String? query,
      @Path("page") required int? page});
}
