part of 'upcoming_movies_bloc.dart';

abstract class UpcomingMoviesState extends Equatable {
  const UpcomingMoviesState();

  @override
  List<Object> get props => [];
}

//initial state
class UpcomingMoviesInitState extends UpcomingMoviesState {
  UpcomingMoviesInitState();

  @override
  List<Object> get props => [];
}

//load upcoming movies
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

//error state
class UpcomingMoviesErrorState extends UpcomingMoviesState {
  final errorMsg;

  const UpcomingMoviesErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

//show loader
class MoviesShowProgressState extends UpcomingMoviesState {
  const MoviesShowProgressState();

  @override
  List<Object> get props => [];
}

//hide loader
class MoviesHideProgressState extends UpcomingMoviesState {
  const MoviesHideProgressState();

  @override
  List<Object> get props => [];
}

//end state of API call
class UpcomingMoviesEndState extends UpcomingMoviesState {
  final bool isSuccess;

  const UpcomingMoviesEndState({required this.isSuccess});
}
