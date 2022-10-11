// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class MoviesEntityData extends DataClass
    implements Insertable<MoviesEntityData> {
  final int movieId;
  final MoviesModel? movie;
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
      movie: serializer.fromJson<MoviesModel?>(json['movie']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'movieId': serializer.toJson<int>(movieId),
      'movie': serializer.toJson<MoviesModel?>(movie),
    };
  }

  MoviesEntityData copyWith({int? movieId, MoviesModel? movie}) =>
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
  final Value<MoviesModel?> movie;
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
    Expression<MoviesModel?>? movie,
  }) {
    return RawValuesInsertable({
      if (movieId != null) 'movie_id': movieId,
      if (movie != null) 'movie': movie,
    });
  }

  MoviesEntityCompanion copyWith(
      {Value<int>? movieId, Value<MoviesModel?>? movie}) {
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
  late final GeneratedColumnWithTypeConverter<MoviesModel, String?> movie =
      GeneratedColumn<String?>('movie', aliasedName, true,
              type: const StringType(), requiredDuringInsert: false)
          .withConverter<MoviesModel>($MoviesEntityTable.$converter0);
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

  static TypeConverter<MoviesModel, String> $converter0 = MovieshConverter();
}

class MovieDetailEntityData extends DataClass
    implements Insertable<MovieDetailEntityData> {
  final int movieId;
  final MovieDetail? movieDetail;
  final MoviesImages? movieImages;
  final MovieVideoResponse? movieVideo;
  MovieDetailEntityData(
      {required this.movieId,
      this.movieDetail,
      this.movieImages,
      this.movieVideo});
  factory MovieDetailEntityData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MovieDetailEntityData(
      movieId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}movie_id'])!,
      movieDetail: $MovieDetailEntityTable.$converter0.mapToDart(
          const StringType()
              .mapFromDatabaseResponse(data['${effectivePrefix}movie_detail'])),
      movieImages: $MovieDetailEntityTable.$converter1.mapToDart(
          const StringType()
              .mapFromDatabaseResponse(data['${effectivePrefix}movie_images'])),
      movieVideo: $MovieDetailEntityTable.$converter2.mapToDart(
          const StringType()
              .mapFromDatabaseResponse(data['${effectivePrefix}movie_video'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['movie_id'] = Variable<int>(movieId);
    if (!nullToAbsent || movieDetail != null) {
      final converter = $MovieDetailEntityTable.$converter0;
      map['movie_detail'] = Variable<String?>(converter.mapToSql(movieDetail));
    }
    if (!nullToAbsent || movieImages != null) {
      final converter = $MovieDetailEntityTable.$converter1;
      map['movie_images'] = Variable<String?>(converter.mapToSql(movieImages));
    }
    if (!nullToAbsent || movieVideo != null) {
      final converter = $MovieDetailEntityTable.$converter2;
      map['movie_video'] = Variable<String?>(converter.mapToSql(movieVideo));
    }
    return map;
  }

  MovieDetailEntityCompanion toCompanion(bool nullToAbsent) {
    return MovieDetailEntityCompanion(
      movieId: Value(movieId),
      movieDetail: movieDetail == null && nullToAbsent
          ? const Value.absent()
          : Value(movieDetail),
      movieImages: movieImages == null && nullToAbsent
          ? const Value.absent()
          : Value(movieImages),
      movieVideo: movieVideo == null && nullToAbsent
          ? const Value.absent()
          : Value(movieVideo),
    );
  }

  factory MovieDetailEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MovieDetailEntityData(
      movieId: serializer.fromJson<int>(json['movieId']),
      movieDetail: serializer.fromJson<MovieDetail?>(json['movieDetail']),
      movieImages: serializer.fromJson<MoviesImages?>(json['movieImages']),
      movieVideo: serializer.fromJson<MovieVideoResponse?>(json['movieVideo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'movieId': serializer.toJson<int>(movieId),
      'movieDetail': serializer.toJson<MovieDetail?>(movieDetail),
      'movieImages': serializer.toJson<MoviesImages?>(movieImages),
      'movieVideo': serializer.toJson<MovieVideoResponse?>(movieVideo),
    };
  }

  MovieDetailEntityData copyWith(
          {int? movieId,
          MovieDetail? movieDetail,
          MoviesImages? movieImages,
          MovieVideoResponse? movieVideo}) =>
      MovieDetailEntityData(
        movieId: movieId ?? this.movieId,
        movieDetail: movieDetail ?? this.movieDetail,
        movieImages: movieImages ?? this.movieImages,
        movieVideo: movieVideo ?? this.movieVideo,
      );
  @override
  String toString() {
    return (StringBuffer('MovieDetailEntityData(')
          ..write('movieId: $movieId, ')
          ..write('movieDetail: $movieDetail, ')
          ..write('movieImages: $movieImages, ')
          ..write('movieVideo: $movieVideo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(movieId, movieDetail, movieImages, movieVideo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieDetailEntityData &&
          other.movieId == this.movieId &&
          other.movieDetail == this.movieDetail &&
          other.movieImages == this.movieImages &&
          other.movieVideo == this.movieVideo);
}

class MovieDetailEntityCompanion
    extends UpdateCompanion<MovieDetailEntityData> {
  final Value<int> movieId;
  final Value<MovieDetail?> movieDetail;
  final Value<MoviesImages?> movieImages;
  final Value<MovieVideoResponse?> movieVideo;
  const MovieDetailEntityCompanion({
    this.movieId = const Value.absent(),
    this.movieDetail = const Value.absent(),
    this.movieImages = const Value.absent(),
    this.movieVideo = const Value.absent(),
  });
  MovieDetailEntityCompanion.insert({
    this.movieId = const Value.absent(),
    this.movieDetail = const Value.absent(),
    this.movieImages = const Value.absent(),
    this.movieVideo = const Value.absent(),
  });
  static Insertable<MovieDetailEntityData> custom({
    Expression<int>? movieId,
    Expression<MovieDetail?>? movieDetail,
    Expression<MoviesImages?>? movieImages,
    Expression<MovieVideoResponse?>? movieVideo,
  }) {
    return RawValuesInsertable({
      if (movieId != null) 'movie_id': movieId,
      if (movieDetail != null) 'movie_detail': movieDetail,
      if (movieImages != null) 'movie_images': movieImages,
      if (movieVideo != null) 'movie_video': movieVideo,
    });
  }

  MovieDetailEntityCompanion copyWith(
      {Value<int>? movieId,
      Value<MovieDetail?>? movieDetail,
      Value<MoviesImages?>? movieImages,
      Value<MovieVideoResponse?>? movieVideo}) {
    return MovieDetailEntityCompanion(
      movieId: movieId ?? this.movieId,
      movieDetail: movieDetail ?? this.movieDetail,
      movieImages: movieImages ?? this.movieImages,
      movieVideo: movieVideo ?? this.movieVideo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (movieId.present) {
      map['movie_id'] = Variable<int>(movieId.value);
    }
    if (movieDetail.present) {
      final converter = $MovieDetailEntityTable.$converter0;
      map['movie_detail'] =
          Variable<String?>(converter.mapToSql(movieDetail.value));
    }
    if (movieImages.present) {
      final converter = $MovieDetailEntityTable.$converter1;
      map['movie_images'] =
          Variable<String?>(converter.mapToSql(movieImages.value));
    }
    if (movieVideo.present) {
      final converter = $MovieDetailEntityTable.$converter2;
      map['movie_video'] =
          Variable<String?>(converter.mapToSql(movieVideo.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovieDetailEntityCompanion(')
          ..write('movieId: $movieId, ')
          ..write('movieDetail: $movieDetail, ')
          ..write('movieImages: $movieImages, ')
          ..write('movieVideo: $movieVideo')
          ..write(')'))
        .toString();
  }
}

class $MovieDetailEntityTable extends MovieDetailEntity
    with TableInfo<$MovieDetailEntityTable, MovieDetailEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovieDetailEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _movieIdMeta = const VerificationMeta('movieId');
  @override
  late final GeneratedColumn<int?> movieId = GeneratedColumn<int?>(
      'movie_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES tags(movie_id)');
  final VerificationMeta _movieDetailMeta =
      const VerificationMeta('movieDetail');
  @override
  late final GeneratedColumnWithTypeConverter<MovieDetail, String?>
      movieDetail = GeneratedColumn<String?>('movie_detail', aliasedName, true,
              type: const StringType(), requiredDuringInsert: false)
          .withConverter<MovieDetail>($MovieDetailEntityTable.$converter0);
  final VerificationMeta _movieImagesMeta =
      const VerificationMeta('movieImages');
  @override
  late final GeneratedColumnWithTypeConverter<MoviesImages, String?>
      movieImages = GeneratedColumn<String?>('movie_images', aliasedName, true,
              type: const StringType(), requiredDuringInsert: false)
          .withConverter<MoviesImages>($MovieDetailEntityTable.$converter1);
  final VerificationMeta _movieVideoMeta = const VerificationMeta('movieVideo');
  @override
  late final GeneratedColumnWithTypeConverter<MovieVideoResponse, String?>
      movieVideo = GeneratedColumn<String?>('movie_video', aliasedName, true,
              type: const StringType(), requiredDuringInsert: false)
          .withConverter<MovieVideoResponse>(
              $MovieDetailEntityTable.$converter2);
  @override
  List<GeneratedColumn> get $columns =>
      [movieId, movieDetail, movieImages, movieVideo];
  @override
  String get aliasedName => _alias ?? 'movie_detail_entity';
  @override
  String get actualTableName => 'movie_detail_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<MovieDetailEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('movie_id')) {
      context.handle(_movieIdMeta,
          movieId.isAcceptableOrUnknown(data['movie_id']!, _movieIdMeta));
    }
    context.handle(_movieDetailMeta, const VerificationResult.success());
    context.handle(_movieImagesMeta, const VerificationResult.success());
    context.handle(_movieVideoMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {movieId};
  @override
  MovieDetailEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MovieDetailEntityData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MovieDetailEntityTable createAlias(String alias) {
    return $MovieDetailEntityTable(attachedDatabase, alias);
  }

  static TypeConverter<MovieDetail, String> $converter0 =
      MovieDetailhConverter();
  static TypeConverter<MoviesImages, String> $converter1 =
      MovieImageshConverter();
  static TypeConverter<MovieVideoResponse, String> $converter2 =
      MovieVideohConverter();
}

class GenresEntityData extends DataClass
    implements Insertable<GenresEntityData> {
  final int genreId;
  final Genres? genre;
  GenresEntityData({required this.genreId, this.genre});
  factory GenresEntityData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return GenresEntityData(
      genreId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}genre_id'])!,
      genre: $GenresEntityTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}genre'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['genre_id'] = Variable<int>(genreId);
    if (!nullToAbsent || genre != null) {
      final converter = $GenresEntityTable.$converter0;
      map['genre'] = Variable<String?>(converter.mapToSql(genre));
    }
    return map;
  }

  GenresEntityCompanion toCompanion(bool nullToAbsent) {
    return GenresEntityCompanion(
      genreId: Value(genreId),
      genre:
          genre == null && nullToAbsent ? const Value.absent() : Value(genre),
    );
  }

  factory GenresEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GenresEntityData(
      genreId: serializer.fromJson<int>(json['genreId']),
      genre: serializer.fromJson<Genres?>(json['genre']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'genreId': serializer.toJson<int>(genreId),
      'genre': serializer.toJson<Genres?>(genre),
    };
  }

  GenresEntityData copyWith({int? genreId, Genres? genre}) => GenresEntityData(
        genreId: genreId ?? this.genreId,
        genre: genre ?? this.genre,
      );
  @override
  String toString() {
    return (StringBuffer('GenresEntityData(')
          ..write('genreId: $genreId, ')
          ..write('genre: $genre')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(genreId, genre);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GenresEntityData &&
          other.genreId == this.genreId &&
          other.genre == this.genre);
}

class GenresEntityCompanion extends UpdateCompanion<GenresEntityData> {
  final Value<int> genreId;
  final Value<Genres?> genre;
  const GenresEntityCompanion({
    this.genreId = const Value.absent(),
    this.genre = const Value.absent(),
  });
  GenresEntityCompanion.insert({
    this.genreId = const Value.absent(),
    this.genre = const Value.absent(),
  });
  static Insertable<GenresEntityData> custom({
    Expression<int>? genreId,
    Expression<Genres?>? genre,
  }) {
    return RawValuesInsertable({
      if (genreId != null) 'genre_id': genreId,
      if (genre != null) 'genre': genre,
    });
  }

  GenresEntityCompanion copyWith({Value<int>? genreId, Value<Genres?>? genre}) {
    return GenresEntityCompanion(
      genreId: genreId ?? this.genreId,
      genre: genre ?? this.genre,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (genreId.present) {
      map['genre_id'] = Variable<int>(genreId.value);
    }
    if (genre.present) {
      final converter = $GenresEntityTable.$converter0;
      map['genre'] = Variable<String?>(converter.mapToSql(genre.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GenresEntityCompanion(')
          ..write('genreId: $genreId, ')
          ..write('genre: $genre')
          ..write(')'))
        .toString();
  }
}

class $GenresEntityTable extends GenresEntity
    with TableInfo<$GenresEntityTable, GenresEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GenresEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _genreIdMeta = const VerificationMeta('genreId');
  @override
  late final GeneratedColumn<int?> genreId = GeneratedColumn<int?>(
      'genre_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _genreMeta = const VerificationMeta('genre');
  @override
  late final GeneratedColumnWithTypeConverter<Genres, String?> genre =
      GeneratedColumn<String?>('genre', aliasedName, true,
              type: const StringType(), requiredDuringInsert: false)
          .withConverter<Genres>($GenresEntityTable.$converter0);
  @override
  List<GeneratedColumn> get $columns => [genreId, genre];
  @override
  String get aliasedName => _alias ?? 'genres_entity';
  @override
  String get actualTableName => 'genres_entity';
  @override
  VerificationContext validateIntegrity(Insertable<GenresEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('genre_id')) {
      context.handle(_genreIdMeta,
          genreId.isAcceptableOrUnknown(data['genre_id']!, _genreIdMeta));
    }
    context.handle(_genreMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {genreId};
  @override
  GenresEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return GenresEntityData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GenresEntityTable createAlias(String alias) {
    return $GenresEntityTable(attachedDatabase, alias);
  }

  static TypeConverter<Genres, String> $converter0 = GenreshConverter();
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  _$AppDb.connect(DatabaseConnection connection) : super.connect(connection);
  late final $MoviesEntityTable moviesEntity = $MoviesEntityTable(this);
  late final $MovieDetailEntityTable movieDetailEntity =
      $MovieDetailEntityTable(this);
  late final $GenresEntityTable genresEntity = $GenresEntityTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [moviesEntity, movieDetailEntity, genresEntity];
}
