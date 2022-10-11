

import '../../data/model/movie_detail/movie_detail.dart';
import '../../data/model/movie_images/movies_images.dart';
import 'movie_detail_api_client.dart';

class MovieDetailApi  {
  final MovieDetailApiClient _apiClient;
  final String? _apiKey;

  MovieDetailApi(this._apiClient,this._apiKey);

  Future<MovieDetail?> fetchMovieDetail({required int movieId}) => _apiClient.fetchMovieDetail(apiKey: _apiKey,
  movieId: movieId);


  Future<MoviesImages?> fetchMovieImages({required int movieId}) => _apiClient.fetchMovieImages(apiKey: _apiKey,
      movieId: movieId);
}
