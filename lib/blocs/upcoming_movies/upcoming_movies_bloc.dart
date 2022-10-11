import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/movies/movies_model.dart';
import '../../repository/movie_db/movies_db_repo.dart';
import '../../repository/movie_list/movies_repository.dart';

part 'upcoming_movies_event.dart';

part 'upcoming_movies_state.dart';

enum LoadType {
  network,
  db,
  none;
}

class UpcomingMoviesBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final MoviesRepository _upcomingMoviesRepo;
  final MoviesDbRepo _moviesDbRepo;
  int _totalNumPages = 0;
  int _currentPage = 1;
  int _totalNumItems = 0;
  LoadType loadTypeData = LoadType.none;
  List<MoviesModel>? _upcomingMoviesList;

  UpcomingMoviesBloc({
    required MoviesRepository upcomingMoviesRepo,
    required MoviesDbRepo moviesDbRepo,
  })  : _upcomingMoviesRepo = upcomingMoviesRepo,
        _moviesDbRepo = moviesDbRepo,
        super(UpcomingMoviesInitState()) {
    on<UpcomingMoviesEvent>((event, emit) async {
      if (event is UpcomingMoviesInitEvent) {
        emit(UpcomingMoviesInitState());
      } else if (event is FetchUpcomingMoviesEvent) {
        /*Here I am checking if internet is connected then API code will be execute otherwise
        data from DB will be load with pagination. From page there will be always call to API fetch event
        but on BLOC side connectivity will be checked. */
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          add(FetchUpcomingMoviesDBEvent(loadFirstPage: event.loadFirstPage));
        } else {
          _mapUpcomingMoviesEvent(event, state);
        }
      } else if (event is FetchUpcomingMoviesDBEvent) {
        _mapFetchUpcomingMoviesDBEvent(event, state);
      }
    });
  }

  _mapFetchUpcomingMoviesDBEvent(
    FetchUpcomingMoviesDBEvent event,
    UpcomingMoviesState state,
  ) async {
    /*If there is special request from page to load first page of data therefore loadFirstPage is checked here.
    * If there is no special call from page then lastLoadType will be check like if last load type was from API then for DB call
    * pagination should be reset */
    if (event.loadFirstPage ?? false || loadTypeData == LoadType.network) {
      _resetPagination();
      emit(const MoviesShowProgressState());
      await _getTotalPagesInMovieDb();
    }
    if (_currentPage <= _totalNumPages) {
      int offset = _currentPage * 10;
      final list = await _moviesDbRepo.getMoviesPaginated(
        limit: 10,
        offset: _totalNumItems < 10
            ? 0
            : _currentPage == 1
                ? 0
                : offset,
      );
      emit(const MoviesHideProgressState());
      _upcomingMoviesList ??= [];
      _upcomingMoviesList?.clear();

      //get movie from DB
      list
          ?.map((movieData) => _upcomingMoviesList?.add((movieData.movie)!))
          .toList();

      loadTypeData = LoadType.db; //last loaded data type
      emit(LoadUpcomingMoviesState(
          isLastPage: _currentPage >= _totalNumPages,
          nextPageKey: _currentPage,
          movieList: _upcomingMoviesList));
    }
  }

  //Event to fetch Movies List
  Future<void> _mapUpcomingMoviesEvent(
    FetchUpcomingMoviesEvent event,
    UpcomingMoviesState state,
  ) async {
    try {
      /*If there is special request from page to load first page of data therefore loadFirstPage is checked here.
    * If there is no special call from page then lastLoadType will be check like if last load type was DB then for API call
    * pagination should be reset */
      if (event.loadFirstPage ?? false || loadTypeData == LoadType.db) {
        _resetPagination();
        emit(const MoviesShowProgressState());
      }

      final response =
          await _upcomingMoviesRepo.fetchUpcomingMovies(page: _currentPage);
      emit(const MoviesHideProgressState());
      loadTypeData = LoadType.network;
      if (response != null) {
        _totalNumPages = response.totalPages ?? 0;
        _currentPage++;
        if (response.results != null &&
            (response.results?.isNotEmpty ?? false)) {
          _upcomingMoviesList ??= [];
          _upcomingMoviesList?.addAll(response.results!);
          //insert data to db
          _upcomingMoviesList?.map((movie) {
            _moviesDbRepo.insertMovies(id: (movie.id)!, movie: movie);
          }).toList();
          emit(LoadUpcomingMoviesState(
              isLastPage: _currentPage >= _totalNumPages,
              nextPageKey: _currentPage,
              movieList: _upcomingMoviesList));
        }
      } else {
        emit(UpcomingMoviesErrorState(errorMsg: 'Error'));
      }
    } on DioError {
      emit(UpcomingMoviesEndState(isSuccess: false));
    } on Error {
      emit(UpcomingMoviesEndState(isSuccess: false));
    }
  }

  _getTotalPagesInMovieDb() async {
    final list = await _moviesDbRepo.getMovies();
    _totalNumItems = list?.length ?? 0;
    _totalNumPages = _totalNumItems ~/ 10;
    _totalNumPages = _totalNumPages == 0 ? 1 : _totalNumPages;
  }

  _resetPagination() {
    _currentPage = 1;
    _totalNumPages = 0;
    _upcomingMoviesList?.clear();
  }
}
