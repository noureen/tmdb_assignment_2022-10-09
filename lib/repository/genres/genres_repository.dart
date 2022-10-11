import 'package:the_movies_db_app/data/model/movie_detail/movie_detail.dart';
import 'package:the_movies_db_app/data/model/movie_images/movies_images.dart';
import 'package:the_movies_db_app/remote/genres/genres_api.dart';
import 'package:the_movies_db_app/remote/movie_detail/movie_detail_api.dart';

import '../../data/model/genre/genre_response.dart';

part '../genres/genres_repository_interface.dart';

class GenresRepository implements GenresRepoInterface {
  final GenresApi _api;

  GenresRepository(this._api);

  @override
  Future<GenreResponse?> fetchGenres() {
    return _api.fetchGenres().then((value) => value);
  }
}
