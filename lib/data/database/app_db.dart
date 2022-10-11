import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:the_movies_db_app/data/database/entity/genre_entity.dart';
import 'package:the_movies_db_app/data/database/entity/movie_detail_entity.dart';

import '../model/genre/genre_converter.dart';
import '../model/movie_detail/genres.dart';
import '../model/movie_detail/movie_detail.dart';
import '../model/movie_detail/movie_detail_converter.dart';
import '../model/movie_images/movie_images_converter.dart';
import '../model/movie_images/movies_images.dart';
import '../model/movie_video/movie_video.dart';
import '../model/movie_video/movie_video_converter.dart';
import '../model/movie_video/movie_video_response.dart';
import '../model/movies/movies_converter.dart';
import '../model/movies/movies_model.dart';
import 'entity/movies_entity.dart';
part 'app_db.g.dart';


//TMDB DB
LazyDatabase openConnection({bool logStatements = false}) {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'tmdb.sqlite'));
    return NativeDatabase(file,logStatements: logStatements);
  });
}



@DriftDatabase(tables: [MoviesEntity,MovieDetailEntity,GenresEntity])
class AppDb extends _$AppDb {
  AppDb(QueryExecutor e) : super(e);

  // this is the new constructor
  AppDb.connect(DatabaseConnection connection) : super.connect(connection);


  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
      beforeOpen: (details) async {},
    );
  }

}
