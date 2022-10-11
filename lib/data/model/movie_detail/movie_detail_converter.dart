import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:the_movies_db_app/data/model/movie_detail/movie_detail.dart';

//Db converter
class MovieDetailhConverter extends TypeConverter<MovieDetail, String> {

  @override
  MovieDetail? mapToDart(String? fromDb) {
    final map = json.decode(fromDb!);
    return MovieDetail.fromJson(map);
  }

  @override
  String? mapToSql(MovieDetail? value) {
    return json.encode(value);
  }
}