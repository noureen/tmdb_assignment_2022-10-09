import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_movies_db_app/blocs/search_movie/search_movie_bloc.dart';
import 'package:the_movies_db_app/constants/constants.dart';
import 'package:the_movies_db_app/screens/search/widget/search_movie_item.dart';
import 'package:the_movies_db_app/widgets/footer.dart';

import '../../blocs/upcoming_movies/upcoming_movies_bloc.dart';
import '../../data/model/movies/movies_model.dart';
import '../../main.dart';
import '../../styles/styles.dart';
import '../../widgets/header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  PagingController<int, MoviesModel>? _pagingController;
  bool _isLastPage = false;

  Future<void> _fetchPage(bool loadFirstPage) async {
    try {
      BlocProvider.of<SearchMovieBloc>(context)
          .add(FetchSearchMovieEvent(loadFirstPage: loadFirstPage));
    } catch (error) {
      _pagingController?.error = error;
    }
  }

  _addPaginationListener() {
    _pagingController?.addPageRequestListener((pageKey) {
      _fetchPage(false);
    });
  }

  @override
  void initState() {
    _addPaginationListener();
    super.initState();
    _resetPagination();
    BlocProvider.of<SearchMovieBloc>(context).add(SearchMovieInitEvent());
  }

  @override
  void dispose() {
    _pagingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HeaderAppBar(searchType: SearchType.search),
            Expanded(child: bodyContent)
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }

  Widget get bodyContent {
    var padLeft = 0.0;
    if (MediaQuery.of(context).size.width > 700) {
      var mod = MediaQuery.of(context).size.width - 750;
      padLeft = mod / 2.0;
    }
    return BlocListener<SearchMovieBloc, SearchMovieState>(
      listener: (context, state) {
        if (state is SearchShowProgressState) {
          progress.showLoader(context);
        } else if (state is SearchHideProgressState) {
          progress.hideLoader();
        } else if (state is UpcomingMoviesErrorState) {}
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: padLeft, right: padLeft),
        height: MediaQuery.of(context).size.height,
        color: bodyGreyColor,
        child: BlocBuilder<SearchMovieBloc, SearchMovieState>(
            builder: (BuildContext context, SearchMovieState state) {

          if (state is LoadSearchMovieState && _pagingController != null) {
            _updatePagination(
                state.isLastPage, state.movieList, state.nextPageKey);
            return PagedListView<int, MoviesModel>(
              shrinkWrap: true,
              pagingController: _pagingController!,
              builderDelegate: PagedChildBuilderDelegate<MoviesModel>(
                itemBuilder: (context, item, index) {
                  final item = _pagingController?.itemList![index];
                  return SearchMovieItem(
                    movie: item,
                  );
                },
              ),
            );
          } else if (state is NoSearchMovieFoundState) {
            return noMovies;
          } else if (state is NoInternetState) {
            return noInternet;
          }
          return searchMovies;
        }),
      ),
    );
  }

  Widget get searchMovies =>  SizedBox(
        child: Center(
          child: Text(strSearchMovies, style: mediumTextMsgs,),
        ),
      );

  Widget get noMovies =>  SizedBox(
        child: Center(
          child: Text(strNoItemFound, style: mediumTextMsgs,),
        ),
      );

  Widget get noInternet =>  SizedBox(
        child: Center(
          child: Text(strNoInternet, style: mediumTextMsgs,),
        ),
      );

  _updatePagination(
      bool? lastPage, List<MoviesModel>? movies, int? nextPageKey) {
    if (nextPageKey == 2) {
      _resetPagination();
    }
    if ((lastPage ?? false) && !_isLastPage) {
      _pagingController?.appendLastPage(movies ?? []);
      _isLastPage = true;
    } else if (!(lastPage ?? false)) {
      _pagingController?.appendPage(movies ?? [], nextPageKey);
    }
  }

  _resetPagination() {
    _isLastPage = false;
    _pagingController?.itemList?.clear();
    _pagingController?.nextPageKey = 0;
    _pagingController?.appendPage([], 0);
    _pagingController?.appendLastPage([]);
    _pagingController?.refresh();
    _pagingController?.dispose();
    _pagingController = PagingController(firstPageKey: 0);
    _addPaginationListener();
  }
}
