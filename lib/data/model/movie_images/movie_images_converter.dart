import 'dart:convert';
import 'package:drift/drift.dart';

import 'movies_images.dart';

//Db converter
class MovieImageshConverter extends TypeConverter<MoviesImages, String> {

  @override
  MoviesImages? mapToDart(String? fromDb) {
    final map = json.decode(fromDb!);
    return MoviesImages.fromJson(map);
  }

  @override
  String? mapToSql(MoviesImages? value) {
    return json.encode(value);
  }
}