import 'package:drift/drift.dart';
import '../app_db.dart';
import '../entity/movie_detail_entity.dart';
import '../entity/movies_entity.dart';
import '../joins/movie_with_detail.dart';

part 'movie_detail_dao.g.dart';

@DriftAccessor(tables: [MovieDetailEntity, MoviesEntity])
class MovieDetailDao extends DatabaseAccessor<AppDb>
    with _$MovieDetailDaoMixin {
  MovieDetailDao(AppDb db) : super(db);

  Future<List<MovieDetailEntityData>> getMoviesDetail() async {
    return await select(movieDetailEntity).get();
  }

  Future<MovieDetailEntityData?> getMovieDetail(int? id) async {
    try {
      return await (select(movieDetailEntity)
            ..where((tbl) => tbl.movieId.equals(id)))
          .getSingle();
    } catch (error) {
      return null;
    }
  }

  Future<int> insertMovieDetail(MovieDetailEntityCompanion entity) async {
    return await into(movieDetailEntity).insertOnConflictUpdate(entity);
  }

  Future<bool> updateMovieDetail(MovieDetailEntityCompanion entity) async {
    return await update(movieDetailEntity).replace(entity);
  }

  Future<List<MovieWithDetail>?> getMoviesWithDetail() async {
    final query = (select(movieDetailEntity)).join([
      leftOuterJoin(moviesEntity,
          moviesEntity.movieId.equalsExp(movieDetailEntity.movieId)),
    ]);
    return query.map((resultRow) {
      return MovieWithDetail(
        moviesEntityData: resultRow.readTable(moviesEntity),
        movieDetailEntityData: resultRow.readTable(movieDetailEntity),
      );
    }).get();
  }
}
