import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/movie_detail/genres.dart';
import '../../repository/genres/genres_repository.dart';
import '../../repository/movie_db/movies_db_repo.dart';
import '../upcoming_movies/upcoming_movies_bloc.dart';

part 'genre_event.dart';

part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final GenresRepository _genresRepo;
  final MoviesDbRepo _moviesDbRepo;
  LoadType loadTypeData = LoadType.none;
  List<Genres>? _genresList;

  GenreBloc({
    required GenresRepository genresRepo,
    required MoviesDbRepo moviesDbRepo,
  })  : _genresRepo = genresRepo,
        _moviesDbRepo = moviesDbRepo,
        super(GenreInitState()) {
    on<GenreEvent>((event, emit) async {
      if (event is GenreInitEvent) {
        emit(GenreInitState());
      } else if (event is FetchGenreEvent) {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          add(FetchGenreDBEvent());
        } else {
          _mapGenreEvent(event, state);
        }
      } else if (event is FetchGenreDBEvent) {
        _mapFetchGenreDBEvent(event, state);
      }
    });
  }

  _mapFetchGenreDBEvent(
    FetchGenreDBEvent event,
    GenreState state,
  ) async {
    emit(const GenreShowProgressState());
    final list = await _moviesDbRepo.getGenres();
    emit(const GenreHideProgressState());
    _genresList ??= [];
    _genresList?.clear();
    list?.map((genreData) => _genresList?.add((genreData.genre)!)).toList();
    loadTypeData = LoadType.db;
    emit(LoadGenreState(genreList: _genresList));
  }

  //Event to fetch Genres List
  Future<void> _mapGenreEvent(
    FetchGenreEvent event,
    GenreState state,
  ) async {
    try {

      emit(const GenreShowProgressState());
      final response = await _genresRepo.fetchGenres();
      emit(const GenreHideProgressState());
      loadTypeData = LoadType.network;
      if (response != null) {
        if (response.genres != null && (response.genres?.isNotEmpty ?? false)) {
          _genresList ??= [];
          _genresList?.clear();
          _genresList?.addAll(response.genres!);
          _genresList?.map((genre) {
            _moviesDbRepo.insertGenre(id: (genre.id)!, genre: genre);
          }).toList();
          emit(LoadGenreState(genreList: _genresList));
        }
      } else {
        emit(GenreErrorState(errorMsg: 'Error'));
      }
    } on DioError {
      emit(GenreEndState(isSuccess: false));
    } on Error {
      emit(GenreEndState(isSuccess: false));
    }
  }
}
