part of 'movie_detail_bloc.dart';

abstract class MovieDetailState {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

//initial state
class MovieDetailInitState extends MovieDetailState {
  const MovieDetailInitState();

  @override
  List<Object> get props => [];
}

//State to load detail and images of movie
class LoadMovieDetailState extends MovieDetailState {
  final MovieDetail? movieDetail;
  final MoviesImages? moviesImages;
  final MovieVideo? movieTrailer;

  const LoadMovieDetailState(
      {this.movieDetail, this.moviesImages, this.movieTrailer});

  @override
  List<Object> get props => [movieDetail ?? [], moviesImages ?? []];
}

//End state of API call
class MovieDetailEndState extends MovieDetailState {
  final bool isSuccess;

  const MovieDetailEndState({required this.isSuccess});
}

//Error State
class MovieDetailErrorState extends MovieDetailState {
  final String errorMsg;

  const MovieDetailErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

//Show Loader
class DetailShowProgressState extends MovieDetailState {
  const DetailShowProgressState();

  @override
  List<Object> get props => [];
}

//Hide Loader
class DetailHideProgressState extends MovieDetailState {
  const DetailHideProgressState();

  @override
  List<Object> get props => [];
}
