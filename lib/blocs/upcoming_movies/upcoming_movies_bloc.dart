import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies_db_app/repository/upcoming_movies_repository.dart';
import '../../data/model/upcoming_movies/upcoming_movies_model.dart';
import '../../repository/movies_db_repo.dart';
import '../../utils/utility.dart';

part 'upcoming_movies_event.dart';

part 'upcoming_movies_state.dart';

class UpcomingMoviesBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final UpcomingMoviesRepository _upcomingMoviesRepo;
  final MoviesDbRepo _moviesDbRepo;
  int _totalNumPages = 0;
  int _currentPage = 1;
  List<UpcomingMoviesModel>? _upcomingMoviesList;

  UpcomingMoviesBloc({
    required UpcomingMoviesRepository upcomingMoviesRepo,
    required MoviesDbRepo moviesDbRepo,
  })  : _upcomingMoviesRepo = upcomingMoviesRepo,
        _moviesDbRepo = moviesDbRepo,
        super(UpcomingMoviesInitState()) {
    on<UpcomingMoviesEvent>((event, emit) {
      if (event is UpcomingMoviesInitEvent) {
        emit(UpcomingMoviesInitState());
      } else if (event is FetchUpcomingMoviesEvent) {
        _mapUpcomingMoviesEvent(event,state);
      }
    });
  }

  //Event to fetch Movies List
  Future<void> _mapUpcomingMoviesEvent(
    FetchUpcomingMoviesEvent event,
    UpcomingMoviesState state,
  ) async {
    try {
      if (event.loadFirstPage ?? false) {
        _currentPage = 1;
        _totalNumPages = 0;
        _upcomingMoviesList?.clear();
      }
      if (_currentPage == 1) {
        emit(const ShowProgressState());
        final response = await _upcomingMoviesRepo.fetchUpcomingMovies();
        emit(const HideProgressState());
        if (response != null) {
          _totalNumPages = response.totalPages ?? 0;
          _currentPage++;
          if (response.results != null &&
              (response.results?.isNotEmpty ?? false)) {
            _upcomingMoviesList ??= [];
            _upcomingMoviesList?.addAll(response.results!);
            _upcomingMoviesList?.map((movie) {
              _moviesDbRepo.insertMovies(id: (movie.id)!, movie: movie);
            }).toList();
            emit(LoadUpcomingMoviesState(
                isLastPage: _currentPage >= _totalNumPages,
                nextPageKey: _currentPage,
                upcomingMovieList: _upcomingMoviesList));
          }
        } else {
          emit(UpcomingMoviesErrorState(errorMsg: 'Error'));
        }
      }
    } on DioError {
      emit(UpcomingMoviesEndState(isSuccess: false));
    } on Error {
      emit(UpcomingMoviesEndState(isSuccess: false));
    }
  }
}
