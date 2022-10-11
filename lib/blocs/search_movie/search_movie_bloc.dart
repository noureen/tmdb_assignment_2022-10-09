import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/movies/movies_model.dart';
import '../../repository/movie_db/movies_db_repo.dart';
import '../../repository/movie_search/search_movies_repository.dart';
import '../../utils/utility.dart';
import '../upcoming_movies/upcoming_movies_bloc.dart';

part 'search_movie_event.dart';

part 'search_movie_state.dart';



class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovieRepository _searchMovieRepository;
  final MoviesDbRepo _moviesDbRepo;
  int _totalNumPages = 0;
  int _currentPage = 1;
  LoadType loadTypeData = LoadType.none;
  List<MoviesModel>? _upcomingMoviesList;
  String? query;

  SearchMovieBloc({
    required SearchMovieRepository searchMovieRepository,
    required MoviesDbRepo moviesDbRepo,
  })  : _searchMovieRepository = searchMovieRepository,
        _moviesDbRepo = moviesDbRepo,
        super(SearchMovieInitState()) {
    on<SearchMovieEvent>((event, emit) async {
      if (event is SearchMovieInitEvent) {
        _resetPagination();
        emit(SearchMovieInitState());
      } else if (event is QueryEvent) {
        query = event.query;
        if (Utility.isSet(query)) {
          add(FetchSearchMovieEvent(loadFirstPage: true));
        }
      } else if (event is FetchSearchMovieEvent) {
        final connect = await (Connectivity().checkConnectivity());
        (connect == ConnectivityResult.none)
            ? emit(const NoInternetState())
            : _mapSearchMovieEvent(event, state);
      }
    });
  }

  //Event to fetch Movies List
  Future<void> _mapSearchMovieEvent(
    FetchSearchMovieEvent event,
    SearchMovieState state,
  ) async {
    try {
      if (event.loadFirstPage ?? false || loadTypeData == LoadType.db) {
        _resetPagination();
        emit(const SearchShowProgressState());
      }

      final response = await _searchMovieRepository.fetchSearchMovie(
          page: _currentPage, query: query);
      emit(const SearchHideProgressState());
      loadTypeData = LoadType.network;

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
          emit(LoadSearchMovieState(
              isLastPage: _currentPage >= _totalNumPages,
              nextPageKey: _currentPage,
              movieList: _upcomingMoviesList));
          return;
        }
      }

      emit(NoSearchMovieFoundState());
    } on DioError {
      emit(SearchMovieEndState(isSuccess: false));
    } on Error {
      emit(SearchMovieEndState(isSuccess: false));
    }
  }

  _resetPagination() {
    _currentPage = 1;
    _totalNumPages = 0;
    _upcomingMoviesList?.clear();
  }
}
