import 'package:drift/drift.dart';
import 'package:the_movies_db_app/data/model/movie_video/movie_video_converter.dart';
import '../../model/movie_detail/movie_detail_converter.dart';
import '../../model/movie_images/movie_images_converter.dart';

class MovieDetailEntity extends Table {
  IntColumn get movieId =>
      integer().customConstraint('NULL REFERENCES tags(movie_id)')();

  TextColumn get movieDetail =>
      text().named('movie_detail').map(MovieDetailhConverter()).nullable()();

  TextColumn get movieImages =>
      text().named('movie_images').map(MovieImageshConverter()).nullable()();

  TextColumn get movieVideo =>
      text().named('movie_video').map(MovieVideohConverter()).nullable()();

  // Making name as the primary key of a tag requires names to be unique
  @override
  Set<Column> get primaryKey => {movieId};
}
