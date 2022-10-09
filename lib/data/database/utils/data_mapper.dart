import 'package:drift/drift.dart';

import '../../model/upcoming_movies/upcoming_movies_model.dart';
import '../app_db.dart';
//DB Data Mapper
class DataMapper {
  static MoviesEntityCompanion insertMapMovie(
          {required int id, required UpcomingMoviesModel? movie}) =>
      MoviesEntityCompanion.insert(movieId: Value(id), movie: Value(movie));
}
