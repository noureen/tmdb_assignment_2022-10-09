import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies_db_app/data/model/movie_images/movies_images.dart';
import 'package:the_movies_db_app/data/model/movie_video/movie_video.dart';
import 'package:the_movies_db_app/data/model/movie_video/movie_video_response.dart';
import 'package:the_movies_db_app/repository/movie_detail/movie_detail_repository.dart';
import '../../data/model/movie_detail/movie_detail.dart';
import '../../repository/movie_db/movies_db_repo.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

enum VideoType {
  trailer,
  teaser,
  featurette,
}

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MoviesDetailRepository _movieDetailRepo;
  final MoviesDbRepo _moviesDbRepo;

  MovieDetailBloc({
    required MoviesDetailRepository movieDetailRepo,
    required MoviesDbRepo moviesDbRepo,
  })  : _movieDetailRepo = movieDetailRepo,
        _moviesDbRepo = moviesDbRepo,
        super(const MovieDetailInitState()) {
    on<MovieDetailEvent>((event, emit) async {
      if (event is MovieDetailInitEvent) {
        emit(const MovieDetailInitState());
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
        MovieVideo? trailer;
        if (detail.movieVideo != null &&
            ((detail.movieVideo)?.results != null &&
                (detail.movieVideo?.results?.isNotEmpty ?? false))) {
          //here find for trailer from videos list
          detail.movieVideo?.results?.map((video) {
            if (video.type?.toLowerCase() == VideoType.trailer.name) {
              trailer = video;
            }
          }).toList();
        }
        emit(LoadMovieDetailState(
            movieDetail: detail.movieDetail,
            moviesImages: detail.movieImages,
            movieTrailer: trailer));
      } else {
        emit(LoadMovieDetailState(movieDetail: detail.movieDetail));
      }
    } else {
      emit(const MovieDetailErrorState(errorMsg: 'Error'));
    }
  }

  //Event to fetch Movie Detail with 2 APIs call 1- movieDetail 2-movieImages
  Future<void> _mapMovieDetailEvent(
    FetchMovieDetailEvent event,
    MovieDetailState state,
  ) async {
    try {
      emit(const DetailShowProgressState());
      debugPrint('IamHereeeeeee111');
      final responseDetail =
          await _movieDetailRepo.fetchMovieDetail(movieId: event.movieId ?? 0);

      final responseImages =
          await _movieDetailRepo.fetchMovieImages(movieId: event.movieId ?? 0);

      final responseVideo =
          await _movieDetailRepo.fetchMovieVideo(movieId: event.movieId ?? 0);
      MovieVideo? trailer;
      debugPrint('IamHereeeeeee222');
      emit(const DetailHideProgressState());
      if (responseDetail != null) {
        //Insert movie detail to db
        _moviesDbRepo.insertMovieDetail(
            id: event.movieId ?? 0, movie: responseDetail);
      }
      //Insert movie images to db
      if (responseImages != null) {
        _moviesDbRepo.insertMovieImages(
            id: event.movieId ?? 0, movie: responseImages);
      }

      //Insert movie videos to db
      if (responseVideo != null &&
          (responseVideo).results != null &&
          ((responseVideo).results?.isNotEmpty ?? false)) {
        _moviesDbRepo.insertMovieVideos(
            id: event.movieId ?? 0, movie: responseVideo);

        //here find for trailer from videos list
        (responseVideo).results?.map((video) {
          if (video.type?.toLowerCase() == VideoType.trailer.name) {
            trailer = video;
          }
        }).toList();
      }

      if (responseDetail != null) {
        //update detail state
        emit(LoadMovieDetailState(
            movieDetail: responseDetail,
            moviesImages: responseImages,
            movieTrailer: trailer));
      } else {
        emit(const MovieDetailErrorState(errorMsg: 'Error'));
      }
    } on DioError {
      emit(const MovieDetailEndState(isSuccess: false));
    } on Error {
      emit(const MovieDetailEndState(isSuccess: false));
    }
  }
}
