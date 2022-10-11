part of 'upcoming_movies_bloc.dart';

abstract class UpcomingMoviesState extends Equatable {
  const UpcomingMoviesState();

  @override
  List<Object> get props => [];
}

class UpcomingMoviesInitState extends UpcomingMoviesState {
  UpcomingMoviesInitState();

  @override
  List<Object> get props => [];
}

class LoadUpcomingMoviesState extends UpcomingMoviesState {
  final List<MoviesModel>? movieList;
  final bool? isLastPage;
  final int? nextPageKey;

  LoadUpcomingMoviesState(
      {required this.movieList,
      required this.isLastPage,
      required this.nextPageKey});

  @override
  List<Object> get props => [nextPageKey ?? 0];
}

class UpcomingMoviesStartState extends UpcomingMoviesState {}

class UpcomingMoviesErrorState extends UpcomingMoviesState {
  final errorMsg;

  UpcomingMoviesErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

class MoviesShowProgressState extends UpcomingMoviesState {
  const MoviesShowProgressState();

  @override
  List<Object> get props => [];
}

class MoviesHideProgressState extends UpcomingMoviesState {
  const MoviesHideProgressState();

  @override
  List<Object> get props => [];
}

class UpcomingMoviesEndState extends UpcomingMoviesState {
  bool isSuccess;

  UpcomingMoviesEndState({required this.isSuccess});
}
