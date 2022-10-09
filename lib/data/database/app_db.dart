import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../model/upcoming_movies/upcoming_movies_converter.dart';
import '../model/upcoming_movies/upcoming_movies_model.dart';
import 'entity/upcoming_movies_entity.dart';
part 'app_db.g.dart';


//TMDB DB
LazyDatabase openConnection({bool logStatements = false}) {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'tmdb.sqlite'));
    return NativeDatabase(file,logStatements: logStatements);
  });
}



@DriftDatabase(tables: [MoviesEntity])
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
