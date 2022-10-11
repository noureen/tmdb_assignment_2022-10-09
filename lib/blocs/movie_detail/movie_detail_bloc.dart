import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies_db_app/data/model/movie_images/movies_images.dart';
import 'package:the_movies_db_app/repository/movie_detail/movie_detail_repository.dart';
import '../../data/model/movie_detail/movie_detail.dart';
import '../../repository/movie_db/movies_db_repo.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MoviesDetailRepository _movieDetailRepo;
  final MoviesDbRepo _moviesDbRepo;

  MovieDetailBloc({
    required MoviesDetailRepository movieDetailRepo,
    required MoviesDbRepo moviesDbRepo,
  })  : _movieDetailRepo = movieDetailRepo,
        _moviesDbRepo = moviesDbRepo,
        super(MovieDetailInitState()) {
    on<MovieDetailEvent>((event, emit) async {
      if (event is MovieDetailInitEvent) {
        emit(MovieDetailInitState());
      } else if (event is FetchMovieDetailEvent) {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          add(FetchMovieDetailDBEvent(movieId: event.movieId));
        } else {
          _mapMovieDetailEvent(event, state);
        }
      } else if (event is FetchMovieDetailDBEvent) {
        _mapFetchMovieDetailDBEvent(event, state);
      }
    });
  }

  //Event to fetch Movie Detail from DB
  Future<void> _mapFetchMovieDetailDBEvent(
    FetchMovieDetailDBEvent event,
    MovieDetailState state,
  ) async {
    emit(const DetailShowProgressState());
    final detail = await _moviesDbRepo.getMovieDetail(movieId: event.movieId);
    emit(const DetailHideProgressState());
    if (detail != null) {
      if (detail.movieImages != null) {
        emit(LoadMovieDetailState(
            movieDetail: detail.movieDetail, moviesImages: detail.movieImages));
      } else {
        emit(LoadMovieDetailState(movieDetail: detail.movieDetail));
      }
    } else {
      emit(MovieDetailErrorState(errorMsg: 'Error'));
    }
  }

  //Event to fetch Movie Detail with 2 APIs call 1- movieDetail 2-movieImages
  Future<void> _mapMovieDetailEvent(
    FetchMovieDetailEvent event,
    MovieDetailState state,
  ) async {
    try {
      emit(const DetailShowProgressState());

      final response = await Future.wait([
        _movieDetailRepo.fetchMovieDetail(movieId: event.movieId ?? 0),
        _movieDetailRepo.fetchMovieImages(movieId: event.movieId ?? 0)
      ]);
      emit(const DetailHideProgressState());
      if (response[0] != null) {
        //Insert movie detail to db
        _moviesDbRepo.insertMovieDetail(
            id: event.movieId ?? 0, movie: response[0] as MovieDetail);
        //Insert movie images to db
        if (response[1] != null) {
          _moviesDbRepo.insertMovieImages(
              id: event.movieId ?? 0, movie: response[1] as MoviesImages);

          //update detail state
          emit(LoadMovieDetailState(
              movieDetail: response[0] as MovieDetail,
              moviesImages: response[1] as MoviesImages));
        } else {
          emit(LoadMovieDetailState(movieDetail: response[0] as MovieDetail));
        }
      } else {
        emit(MovieDetailErrorState(errorMsg: 'Error'));
      }
    } on DioError {
      emit(MovieDetailEndState(isSuccess: false));
    } on Error {
      emit(MovieDetailEndState(isSuccess: false));
    }
  }
}
