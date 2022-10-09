// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class MoviesEntityData extends DataClass
    implements Insertable<MoviesEntityData> {
  final int movieId;
  final UpcomingMoviesModel? movie;
  MoviesEntityData({required this.movieId, this.movie});
  factory MoviesEntityData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MoviesEntityData(
      movieId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}movie_id'])!,
      movie: $MoviesEntityTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}movie'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['movie_id'] = Variable<int>(movieId);
    if (!nullToAbsent || movie != null) {
      final converter = $MoviesEntityTable.$converter0;
      map['movie'] = Variable<String?>(converter.mapToSql(movie));
    }
    return map;
  }

  MoviesEntityCompanion toCompanion(bool nullToAbsent) {
    return MoviesEntityCompanion(
      movieId: Value(movieId),
      movie:
          movie == null && nullToAbsent ? const Value.absent() : Value(movie),
    );
  }

  factory MoviesEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MoviesEntityData(
      movieId: serializer.fromJson<int>(json['movieId']),
      movie: serializer.fromJson<UpcomingMoviesModel?>(json['movie']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'movieId': serializer.toJson<int>(movieId),
      'movie': serializer.toJson<UpcomingMoviesModel?>(movie),
    };
  }

  MoviesEntityData copyWith({int? movieId, UpcomingMoviesModel? movie}) =>
      MoviesEntityData(
        movieId: movieId ?? this.movieId,
        movie: movie ?? this.movie,
      );
  @override
  String toString() {
    return (StringBuffer('MoviesEntityData(')
          ..write('movieId: $movieId, ')
          ..write('movie: $movie')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(movieId, movie);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MoviesEntityData &&
          other.movieId == this.movieId &&
          other.movie == this.movie);
}

class MoviesEntityCompanion extends UpdateCompanion<MoviesEntityData> {
  final Value<int> movieId;
  final Value<UpcomingMoviesModel?> movie;
  const MoviesEntityCompanion({
    this.movieId = const Value.absent(),
    this.movie = const Value.absent(),
  });
  MoviesEntityCompanion.insert({
    this.movieId = const Value.absent(),
    this.movie = const Value.absent(),
  });
  static Insertable<MoviesEntityData> custom({
    Expression<int>? movieId,
    Expression<UpcomingMoviesModel?>? movie,
  }) {
    return RawValuesInsertable({
      if (movieId != null) 'movie_id': movieId,
      if (movie != null) 'movie': movie,
    });
  }

  MoviesEntityCompanion copyWith(
      {Value<int>? movieId, Value<UpcomingMoviesModel?>? movie}) {
    return MoviesEntityCompanion(
      movieId: movieId ?? this.movieId,
      movie: movie ?? this.movie,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (movieId.present) {
      map['movie_id'] = Variable<int>(movieId.value);
    }
    if (movie.present) {
      final converter = $MoviesEntityTable.$converter0;
      map['movie'] = Variable<String?>(converter.mapToSql(movie.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesEntityCompanion(')
          ..write('movieId: $movieId, ')
          ..write('movie: $movie')
          ..write(')'))
        .toString();
  }
}

class $MoviesEntityTable extends MoviesEntity
    with TableInfo<$MoviesEntityTable, MoviesEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoviesEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _movieIdMeta = const VerificationMeta('movieId');
  @override
  late final GeneratedColumn<int?> movieId = GeneratedColumn<int?>(
      'movie_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _movieMeta = const VerificationMeta('movie');
  @override
  late final GeneratedColumnWithTypeConverter<UpcomingMoviesModel, String?>
      movie = GeneratedColumn<String?>('movie', aliasedName, true,
              type: const StringType(), requiredDuringInsert: false)
          .withConverter<UpcomingMoviesModel>($MoviesEntityTable.$converter0);
  @override
  List<GeneratedColumn> get $columns => [movieId, movie];
  @override
  String get aliasedName => _alias ?? 'movies_entity';
  @override
  String get actualTableName => 'movies_entity';
  @override
  VerificationContext validateIntegrity(Insertable<MoviesEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('movie_id')) {
      context.handle(_movieIdMeta,
          movieId.isAcceptableOrUnknown(data['movie_id']!, _movieIdMeta));
    }
    context.handle(_movieMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {movieId};
  @override
  MoviesEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MoviesEntityData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MoviesEntityTable createAlias(String alias) {
    return $MoviesEntityTable(attachedDatabase, alias);
  }

  static TypeConverter<UpcomingMoviesModel, String> $converter0 =
      UpComingMovieshConverter();
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  _$AppDb.connect(DatabaseConnection connection) : super.connect(connection);
  late final $MoviesEntityTable moviesEntity = $MoviesEntityTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [moviesEntity];
}
