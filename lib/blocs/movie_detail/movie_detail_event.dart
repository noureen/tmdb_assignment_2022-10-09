part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent {}

//Initial Event
class MovieDetailInitEvent extends MovieDetailEvent {
  MovieDetailInitEvent();

  @override
  List<Object> get props => [];
}

//Event to fetch movies list
class FetchMovieDetailEvent extends MovieDetailEvent {
  final int? movieId;

  FetchMovieDetailEvent({required this.movieId});

  @override
  List<Object> get props => [movieId ?? 0];
}

//Event to fetch movies detail from DB
class FetchMovieDetailDBEvent extends MovieDetailEvent {
  final int? movieId;

  FetchMovieDetailDBEvent({required this.movieId});

  @override
  List<Object> get props => [movieId ?? 0];
}
