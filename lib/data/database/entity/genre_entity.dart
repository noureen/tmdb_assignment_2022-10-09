import 'package:drift/drift.dart';

import '../../model/genre/genre_converter.dart';

//Movie Entity
class GenresEntity extends Table {
  IntColumn get genreId => integer().named("genre_id")();

  TextColumn get genre =>
      text().named('genre').map(GenreshConverter()).nullable()();

  // Making name as the primary key of a tag requires names to be unique
  @override
  Set<Column> get primaryKey => {genreId};
}
