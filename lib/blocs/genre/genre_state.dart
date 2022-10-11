part of 'genre_bloc.dart';

abstract class GenreState extends Equatable {
  const GenreState();

  @override
  List<Object> get props => [];
}

class GenreInitState extends GenreState {
  GenreInitState();

  @override
  List<Object> get props => [];
}

class LoadGenreState extends GenreState {
  final List<Genres>? genreList;

  LoadGenreState({required this.genreList});

  @override
  List<Object> get props => [genreList ?? []];
}

class GenreErrorState extends GenreState {
  final errorMsg;

  GenreErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

class GenreShowProgressState extends GenreState {
  const GenreShowProgressState();

  @override
  List<Object> get props => [];
}

class GenreHideProgressState extends GenreState {
  const GenreHideProgressState();

  @override
  List<Object> get props => [];
}

class GenreEndState extends GenreState {
  bool isSuccess;

  GenreEndState({required this.isSuccess});
}
