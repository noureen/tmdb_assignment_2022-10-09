import 'package:drift/drift.dart';
import 'package:the_movies_db_app/data/model/movie_detail/genres.dart';
import 'package:the_movies_db_app/data/model/movie_detail/movie_detail.dart';
import 'package:the_movies_db_app/data/model/movie_images/movies_images.dart';

import '../../model/movies/movies_model.dart';
import '../app_db.dart';

//DB Data Mapper
class DataMapper {
  //Movie
  static MoviesEntityCompanion insertMapMovie(
          {required int id, required MoviesModel? movie}) =>
      MoviesEntityCompanion.insert(movieId: Value(id), movie: Value(movie));

  //MovieDetail

  static MovieDetailEntityCompanion insertMapMovieDetail(
          {required int id, required MovieDetail? movieDetail}) =>
      MovieDetailEntityCompanion.insert(
          movieId: Value(id), movieDetail: Value(movieDetail));

  static MovieDetailEntityCompanion insertMapMovieImages(
          {required int id, required MoviesImages? movieImages}) =>
      MovieDetailEntityCompanion.insert(
          movieId: Value(id), movieImages: Value(movieImages));

  //Genre

  static GenresEntityCompanion insertMapGenre(
          {required int id, required Genres? genre}) =>
      GenresEntityCompanion.insert(genreId: Value(id), genre: Value(genre));
}
