import '../app_db.dart';

class MovieWithDetail {
  final MoviesEntityData moviesEntityData;
  final MovieDetailEntityData movieDetailEntityData;

  MovieWithDetail({
    required this.moviesEntityData,
    required this.movieDetailEntityData,
  });
}
