import 'package:drift/drift.dart';

import '../../model/movies/movies_converter.dart';


//Movie Entity
class MoviesEntity extends Table {
  IntColumn get movieId => integer().named("movie_id")();

  TextColumn get movie =>
      text().named('movie').map(MovieshConverter()).nullable()();

  // Making name as the primary key of a tag requires names to be unique
  @override
  Set<Column> get primaryKey => {movieId};
}
