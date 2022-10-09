import 'package:drift/drift.dart';
import 'package:the_movies_db_app/data/database/entity/upcoming_movies_entity.dart';
import '../app_db.dart';

part 'movies_dao.g.dart';

//Movies DAO to save movies
@DriftAccessor(tables: [MoviesEntity])
class MoviesDao extends DatabaseAccessor<AppDb> with _$MoviesDaoMixin {
  MoviesDao(AppDb db) : super(db);

  Future<List<MoviesEntityData>?> getSyncer() async {
    try {
      return await (select(moviesEntity)).get();
    } on Error {
      return null;
    }
  }

  Future<int> insertMoviesDao(MoviesEntityCompanion entity) async {
    return await into(moviesEntity).insertOnConflictUpdate(entity);
  }

  Future<bool> updateMoviesDao(MoviesEntityCompanion entity) async {
    return await update(moviesEntity).replace(entity);
  }
}
