import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../data/database/app_db.dart';
import '../../remote/upcoming_movies/upcoming_movies_api.dart';
import '../../remote/upcoming_movies/upcoming_movies_api_client.dart';
import '../../repository/movies_db_repo.dart';
import '../../repository/upcoming_movies_repository.dart';
import '../module/network_module.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerSingleton(AppDb(openConnection(logStatements: false)));
  locator
      .registerSingleton<Dio>(NetworkModule.provideDio());
  locator.registerSingleton(UpcomingMoviesApiClient(locator.get()));
  locator.registerSingleton(UpcomingMoviesApi(locator.get(),'a5b237f3bf82b53a2da0ce860d448df2'));
  locator.registerSingleton(UpcomingMoviesRepository(locator.get()));
  locator.registerSingleton(MoviesDbRepo());


}
