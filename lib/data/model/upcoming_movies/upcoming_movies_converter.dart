import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:the_movies_db_app/data/model/upcoming_movies/upcoming_movies_model.dart';

//Db converter
class UpComingMovieshConverter extends TypeConverter<UpcomingMoviesModel, String> {

  @override
  UpcomingMoviesModel? mapToDart(String? fromDb) {
    final map = json.decode(fromDb!);
    return UpcomingMoviesModel.fromJson(map);
  }

  @override
  String? mapToSql(UpcomingMoviesModel? value) {
    return json.encode(value);
  }
}