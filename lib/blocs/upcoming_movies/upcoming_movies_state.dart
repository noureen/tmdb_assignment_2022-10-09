part of 'upcoming_movies_bloc.dart';

abstract class UpcomingMoviesState /*extends Equatable*/ {
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
  final List<UpcomingMoviesModel>? upcomingMovieList;
  final bool? isLastPage;
  final int? nextPageKey;

  LoadUpcomingMoviesState({required this.upcomingMovieList,required this.isLastPage, required this.nextPageKey});

  @override
  List<Object> get props => [];
}

class UpcomingMoviesStartState extends UpcomingMoviesState {}

class UpcomingMoviesEndState extends UpcomingMoviesState {
  bool isSuccess;

  UpcomingMoviesEndState({required this.isSuccess});
}

class UpcomingMoviesErrorState extends UpcomingMoviesState {
  final errorMsg;

  UpcomingMoviesErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

class ShowProgressState extends UpcomingMoviesState {
  const ShowProgressState();

  @override
  List<Object> get props => [];
}

class HideProgressState extends UpcomingMoviesState {
  const HideProgressState();

  @override
  List<Object> get props => [];
}
