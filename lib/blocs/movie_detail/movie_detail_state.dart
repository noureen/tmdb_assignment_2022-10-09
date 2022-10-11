part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitState extends MovieDetailState {
  MovieDetailInitState();

  @override
  List<Object> get props => [];
}

class LoadMovieDetailState extends MovieDetailState {
  final MovieDetail? movieDetail;
  final MoviesImages? moviesImages;

  LoadMovieDetailState({this.movieDetail, this.moviesImages});

  @override
  List<Object> get props => [movieDetail ?? [], moviesImages ?? []];
}

class MovieDetailStartState extends MovieDetailState {}

class MovieDetailEndState extends MovieDetailState {
  bool isSuccess;

  MovieDetailEndState({required this.isSuccess});
}

class MovieDetailErrorState extends MovieDetailState {
  final errorMsg;

  MovieDetailErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

class DetailShowProgressState extends MovieDetailState {
  const DetailShowProgressState();

  @override
  List<Object> get props => [];
}

class DetailHideProgressState extends MovieDetailState {
  const DetailHideProgressState();

  @override
  List<Object> get props => [];
}
