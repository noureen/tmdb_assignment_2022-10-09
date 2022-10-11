import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:the_movies_db_app/remote/genres/genres_api.dart';
import 'package:the_movies_db_app/remote/genres/genres_api_client.dart';
import 'package:the_movies_db_app/remote/movie_detail/movie_detail_api_client.dart';
import 'package:the_movies_db_app/remote/movie_search/search_movies_api.dart';
import 'package:the_movies_db_app/remote/movie_search/search_movies_api_client.dart';
import 'package:the_movies_db_app/repository/genres/genres_repository.dart';
import 'package:the_movies_db_app/repository/movie_detail/movie_detail_repository.dart';
import 'package:the_movies_db_app/repository/movie_search/search_movies_repository.dart';
import '../../data/database/app_db.dart';
import '../../remote/movie_detail/movie_detail_api.dart';
import '../../remote/movies/movies_api.dart';
import '../../remote/movies/movies_api_client.dart';
import '../../repository/movie_db/movies_db_repo.dart';
import '../../repository/movie_list/movies_repository.dart';
import '../module/network_module.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerSingleton(AppDb(openConnection(logStatements: false)));
  locator.registerSingleton<Dio>(NetworkModule.provideDio());

  locator.registerSingleton(MoviesApiClient(locator.get()));
  locator.registerSingleton(
      MoviesApi(locator.get(), 'a5b237f3bf82b53a2da0ce860d448df2'));
  locator.registerSingleton(MoviesRepository(locator.get()));
  locator.registerSingleton(MoviesDbRepo());

  locator.registerSingleton(MovieDetailApiClient(locator.get()));
  locator.registerSingleton(
      MovieDetailApi(locator.get(), 'a5b237f3bf82b53a2da0ce860d448df2'));
  locator.registerSingleton(MoviesDetailRepository(locator.get()));

  locator.registerSingleton(SearchMovieApiClient(locator.get()));
  locator.registerSingleton(
      SearchMovieApi(locator.get(), 'a5b237f3bf82b53a2da0ce860d448df2'));
  locator.registerSingleton(SearchMovieRepository(locator.get()));

  locator.registerSingleton(GenresApiClient(locator.get()));
  locator.registerSingleton(
      GenresApi(locator.get(), 'a5b237f3bf82b53a2da0ce860d448df2'));
  locator.registerSingleton(GenresRepository(locator.get()));
}
