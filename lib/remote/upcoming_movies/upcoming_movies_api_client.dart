import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../constants/endpoints.dart';
import '../../data/model/upcoming_movies/upcoming_movies_response.dart';

part 'upcoming_movies_api_client.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class UpcomingMoviesApiClient {
  factory UpcomingMoviesApiClient(Dio dio,{String baseUrl}) = _UpcomingMoviesApiClient;

  @GET(Endpoints.upcomingMovie)
  Future<UpcomingMoviesResponse?> fetchUpcomingMovies(
      {@Path("api_key") required String? apiKey});

}
