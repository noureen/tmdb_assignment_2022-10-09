part of 'search_movie_bloc.dart';

abstract class SearchMovieState extends Equatable {
  const SearchMovieState();

  @override
  List<Object> get props => [];
}

//initial state
class SearchMovieInitState extends SearchMovieState {
  SearchMovieInitState();

  @override
  List<Object> get props => [];
}

//load search results
class LoadSearchMovieState extends SearchMovieState {
  final List<MoviesModel>? movieList;
  final bool? isLastPage;
  final int? nextPageKey;

  LoadSearchMovieState(
      {required this.movieList,
      required this.isLastPage,
      required this.nextPageKey});

  @override
  List<Object> get props => [nextPageKey ?? 0];
}

//End state of API calls
class SearchMovieEndState extends SearchMovieState {
  bool isSuccess;

  SearchMovieEndState({required this.isSuccess});
}

//In case of error like no data found
class SearchMovieErrorState extends SearchMovieState {
  final errorMsg;

  SearchMovieErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

//show loader
class SearchShowProgressState extends SearchMovieState {
  const SearchShowProgressState();

  @override
  List<Object> get props => [];
}

//hide loader
class SearchHideProgressState extends SearchMovieState {
  const SearchHideProgressState();

  @override
  List<Object> get props => [];
}

//no movies found against query
class NoSearchMovieFoundState extends SearchMovieState {
  NoSearchMovieFoundState();

  @override
  List<Object> get props => [];
}

//in case internet is not connected
class NoInternetState extends SearchMovieState {
  const NoInternetState();

  @override
  List<Object> get props => [];
}
