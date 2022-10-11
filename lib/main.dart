import 'dart:io';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:the_movies_db_app/blocs/genre/genre_bloc.dart';
import 'package:the_movies_db_app/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:the_movies_db_app/blocs/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:the_movies_db_app/di/component/locator.dart';
import 'package:the_movies_db_app/utils/routes.dart';
import 'package:the_movies_db_app/widgets/custom_loader.dart';
import 'blocs/bloc_delegate.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/search_movie/search_movie_bloc.dart';

int globalSelectIndex = 0;
final CustomLoader progress = CustomLoader();

void main() async {
  await setupLocator();
  Bloc.observer = AppBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UpcomingMoviesBloc>(
        create: (_) => UpcomingMoviesBloc(
            upcomingMoviesRepo: locator.get(), moviesDbRepo: locator.get()),
      ),
      BlocProvider<MovieDetailBloc>(
        create: (_) => MovieDetailBloc(
            movieDetailRepo: locator.get(), moviesDbRepo: locator.get()),
      ),
      BlocProvider<SearchMovieBloc>(
        create: (_) => SearchMovieBloc(
            searchMovieRepository: locator.get(), moviesDbRepo: locator.get()),
      ),
      BlocProvider<GenreBloc>(
        create: (_) =>
            GenreBloc(genresRepo: locator.get(), moviesDbRepo: locator.get()),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          // Remove the debug banner
          debugShowCheckedModeBanner: false,
          title: 'TMDB',
          theme: Theme.of(context).copyWith(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          getPages: appRoutes(),
        );
      },
    );
  }
}
