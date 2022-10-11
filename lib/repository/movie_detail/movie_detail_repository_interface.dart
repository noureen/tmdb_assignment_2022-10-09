part of '../movie_detail/movie_detail_repository.dart';

abstract class MoviesDetailRepoInterface {
  Future<MovieDetail?> fetchMovieDetail({required int movieId});

  Future<MoviesImages?> fetchMovieImages({required int movieId});

  Future<MovieVideoResponse?> fetchMovieVideo({required int movieId});
}
