import 'package:drift/drift.dart';
import '../app_db.dart';
import '../entity/movies_entity.dart';

part 'movies_dao.g.dart';

//Movies DAO to save movies
@DriftAccessor(tables: [MoviesEntity])
class MoviesDao extends DatabaseAccessor<AppDb> with _$MoviesDaoMixin {
  MoviesDao(AppDb db) : super(db);

  Future<List<MoviesEntityData>?> getMovies() async {
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

  Future<List<MoviesEntityData>?> getMoviesPaginated({
    required int limit,
    required int offset,
  }) async {
    return (select(moviesEntity)..limit(limit, offset: offset)).get();
  }
}
