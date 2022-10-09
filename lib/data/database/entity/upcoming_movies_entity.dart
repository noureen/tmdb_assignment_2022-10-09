import 'package:drift/drift.dart';

import '../../model/upcoming_movies/upcoming_movies_converter.dart';

//Movie Entity
class MoviesEntity extends Table {
  IntColumn get movieId => integer().named("movie_id")();

  TextColumn get movie =>
      text().named('movie').map(UpComingMovieshConverter()).nullable()();

  // Making name as the primary key of a tag requires names to be unique
  @override
  Set<Column> get primaryKey => {movieId};
}
