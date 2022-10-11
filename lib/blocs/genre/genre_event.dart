part of 'genre_bloc.dart';

abstract class GenreEvent {}

//Initial Event
class GenreInitEvent extends GenreEvent {
  GenreInitEvent();

  @override
  List<Object> get props => [];
}

//Event to fetch movies list
class FetchGenreEvent extends GenreEvent {
  FetchGenreEvent();

  @override
  List<Object> get props => [];
}

//Event to fetch movies list
class FetchGenreDBEvent extends GenreEvent {
  FetchGenreDBEvent();

  @override
  List<Object> get props => [];
}
