import 'dart:async';

import '../data/model/upcoming_movies/upcoming_movies_model.dart';


abstract class MoviesDbRepoInterface {

  Future<int> insertMovies(
      {required int id, UpcomingMoviesModel? movie});
}
