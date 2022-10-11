part of 'search_movie_bloc.dart';

abstract class SearchMovieEvent {}

//Initial Event
class SearchMovieInitEvent extends SearchMovieEvent {
  final Function()? callback;

  SearchMovieInitEvent({this.callback});

  @override
  List<Object> get props => [];
}

//Event to fetch movies list
class FetchSearchMovieEvent extends SearchMovieEvent {
  final bool? loadFirstPage;

  FetchSearchMovieEvent({this.loadFirstPage = false});

  @override
  List<Object> get props => [];
}


class QueryEvent extends SearchMovieEvent {
  final String? query;

  QueryEvent({required this.query});

  @override
  List<Object> get props => [];
}

