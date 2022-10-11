import 'dart:convert';
import 'package:drift/drift.dart';

import '../movie_detail/genres.dart';

//Db converter
class GenreshConverter extends TypeConverter<Genres, String> {
  @override
  Genres? mapToDart(String? fromDb) {
    final map = json.decode(fromDb!);
    return Genres.fromJson(map);
  }

  @override
  String? mapToSql(Genres? value) {
    return json.encode(value);
  }
}
