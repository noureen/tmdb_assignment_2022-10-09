part of 'upcoming_movies_bloc.dart';


abstract class UpcomingMoviesEvent {}

//Initial Event
class UpcomingMoviesInitEvent extends UpcomingMoviesEvent {
  UpcomingMoviesInitEvent();

  @override
  List<Object> get props => [];
}

//Event to fetch movies list
class FetchUpcomingMoviesEvent extends UpcomingMoviesEvent {
  final bool? loadFirstPage;

  FetchUpcomingMoviesEvent(
      {this.loadFirstPage = false});


  @override
  List<Object> get props => [];
}


//Event to fetch movies list
class FetchUpcomingMoviesDBEvent extends UpcomingMoviesEvent {
  final bool? loadFirstPage;

  FetchUpcomingMoviesDBEvent(
      {this.loadFirstPage = false});


  @override
  List<Object> get props => [];
}

