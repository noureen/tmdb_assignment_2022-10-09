part of 'search_movie_bloc.dart';

abstract class SearchMovieState /*extends Equatable*/ {
  const SearchMovieState();

  @override
  List<Object> get props => [];
}

class SearchMovieInitState extends SearchMovieState {
  SearchMovieInitState();

  @override
  List<Object> get props => [];
}

class LoadSearchMovieState extends SearchMovieState {
  final List<MoviesModel>? movieList;
  final bool? isLastPage;
  final int? nextPageKey;

  LoadSearchMovieState(
      {required this.movieList,
      required this.isLastPage,
      required this.nextPageKey});

  @override
  List<Object> get props => [];
}

class SearchMovieStartState extends SearchMovieState {}

class SearchMovieEndState extends SearchMovieState {
  bool isSuccess;

  SearchMovieEndState({required this.isSuccess});
}

class SearchMovieErrorState extends SearchMovieState {
  final errorMsg;

  SearchMovieErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

class SearchShowProgressState extends SearchMovieState {
  const SearchShowProgressState();

  @override
  List<Object> get props => [];
}

class SearchHideProgressState extends SearchMovieState {
  const SearchHideProgressState();

  @override
  List<Object> get props => [];
}

class NoSearchMovieFoundState extends SearchMovieState {
  NoSearchMovieFoundState();

  @override
  List<Object> get props => [];
}

class NoInternetState extends SearchMovieState {
  const  NoInternetState();

  @override
  List<Object> get props => [];
}
