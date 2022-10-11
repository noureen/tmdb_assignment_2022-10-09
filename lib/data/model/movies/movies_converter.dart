import 'dart:convert';
import 'package:drift/drift.dart';

import 'movies_model.dart';

//Db converter
class MovieshConverter extends TypeConverter<MoviesModel, String> {

  @override
  MoviesModel? mapToDart(String? fromDb) {
    final map = json.decode(fromDb!);
    return MoviesModel.fromJson(map);
  }

  @override
  String? mapToSql(MoviesModel? value) {
    return json.encode(value);
  }
}