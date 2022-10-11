import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:the_movies_db_app/data/model/movie_images/movies_images.dart';
import '../../constants/endpoints.dart';
import '../../data/model/movie_detail/movie_detail.dart';

part 'movie_detail_api_client.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class MovieDetailApiClient {
  factory MovieDetailApiClient(Dio dio,{String baseUrl}) = _MovieDetailApiClient;

  @GET(Endpoints.movieDetail)
  Future<MovieDetail?> fetchMovieDetail(
      {@Path("api_key") required String? apiKey,
        @Path("movie_id") required int? movieId});


  @GET(Endpoints.movieImages)
  Future<MoviesImages?> fetchMovieImages(
      {@Path("api_key") required String? apiKey,
        @Path("movie_id") required int? movieId});
}
