import 'package:the_movies_db_app/data/model/movie_detail/movie_detail.dart';
import 'package:the_movies_db_app/data/model/movie_images/movies_images.dart';
import 'package:the_movies_db_app/remote/movie_detail/movie_detail_api.dart';


part '../movie_detail/movie_detail_repository_interface.dart';

class MoviesDetailRepository implements MoviesDetailRepoInterface{
  final MovieDetailApi _api;

  MoviesDetailRepository(this._api);

  @override
  Future<MovieDetail?> fetchMovieDetail({required int movieId}) {
    return _api.fetchMovieDetail(movieId:movieId).then((value) => value);
  }

  @override
  Future<MoviesImages?> fetchMovieImages({required int movieId}) {
    return _api.fetchMovieImages(movieId:movieId).then((value) => value);
  }
}