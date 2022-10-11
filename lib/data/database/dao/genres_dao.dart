import 'package:drift/drift.dart';
import 'package:the_movies_db_app/data/database/entity/genre_entity.dart';
import '../app_db.dart';

part 'genres_dao.g.dart';

//Genres DAO to save movies
@DriftAccessor(tables: [GenresEntity])
class GenresDao extends DatabaseAccessor<AppDb> with _$GenresDaoMixin {
  GenresDao(AppDb db) : super(db);

  Future<List<GenresEntityData>?> getGenres() async {
    try {
      return await (select(genresEntity)).get();
    } on Error {
      return null;
    }
  }

  Future<int> insertGenresDao(GenresEntityCompanion entity) async {
    return await into(genresEntity).insertOnConflictUpdate(entity);
  }

  Future<bool> updateGenresDao(GenresEntityCompanion entity) async {
    return await update(genresEntity).replace(entity);
  }
}
