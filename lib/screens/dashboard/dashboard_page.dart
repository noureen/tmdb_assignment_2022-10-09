import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_movies_db_app/constants/constants.dart';
import 'package:the_movies_db_app/screens/dashboard/widgets/item_movies.dart';
import 'package:the_movies_db_app/widgets/footer.dart';
import '../../blocs/upcoming_movies/upcoming_movies_bloc.dart';
import '../../data/model/movies/movies_model.dart';
import '../../main.dart';
import '../../styles/styles.dart';
import '../../widgets/header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  PagingController<int, MoviesModel>? _pagingController;
  bool _isLastPage = false;

  Future<void> _fetchPage(bool isLoadFirstPage) async {
    try {
      BlocProvider.of<UpcomingMoviesBloc>(context)
          .add(FetchUpcomingMoviesEvent(loadFirstPage: isLoadFirstPage));
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
    BlocProvider.of<UpcomingMoviesBloc>(context).add(UpcomingMoviesInitEvent());
  }

  @override
  void dispose() {
    _pagingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: WillPopScope(
        child: Column(
          children: [const HeaderAppBar(searchType: SearchType.watch,), Expanded(child: bodyContent)],
        ),
        onWillPop: () async {
          Navigator.pop(context);
          return false;
        },
      ),
      bottomNavigationBar: Footer(),
    ));
  }

  Widget get bodyContent {
    var padLeft = 0.0;
    if (MediaQuery.of(context).size.width > 700) {
      var mod = MediaQuery.of(context).size.width - 700;
      padLeft = mod / 2.0;
    }
    return BlocListener<UpcomingMoviesBloc, UpcomingMoviesState>(
      listener: (context, state) {
        if (state is UpcomingMoviesInitState) {
          _fetchPage(true);
        } else if (state is MoviesShowProgressState) {
          progress.showLoader(context);
        } else if (state is MoviesHideProgressState) {
          progress.hideLoader();
        } else if (state is UpcomingMoviesErrorState) {}
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: padLeft, right: padLeft),
        height: MediaQuery.of(context).size.height,
        color: bodyGreyColor,
        child: BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
            builder: (BuildContext context, UpcomingMoviesState state) {
          if (state is LoadUpcomingMoviesState && _pagingController != null) {
            _updatePagination(
                state.isLastPage, state.movieList, state.nextPageKey);
            return PagedListView<int, MoviesModel>(
              shrinkWrap: true,
              pagingController: _pagingController!,
              builderDelegate: PagedChildBuilderDelegate<MoviesModel>(
                itemBuilder: (context, item, index) {
                  final item = _pagingController?.itemList![index];
                  return MovieListItem(
                    movie: item,
                  );
                },
              ),
            );
          } else if (state is UpcomingMoviesInitState ||
              state is MoviesShowProgressState) {
            return const SizedBox();
          }
          return noMovies;
        }),
      ),
    );
  }


  //if there is no data/movie
  Widget get noMovies => SizedBox(
        child: Center(
          child: Text(
            strUpcomingNoItemsFound,
            style: mediumTextMsgs,
          ),
        ),
      );

  //checking to update pagination controller last and more pages
  _updatePagination(
      bool? isLastPage, List<MoviesModel>? movies, int? nextPageKey) {
    if (nextPageKey == 2) {
      _resetPagination();
    }
    if ((isLastPage ?? false) && !_isLastPage) {
      _pagingController?.appendLastPage(movies ?? []);
      _isLastPage = true;
    } else if (!(isLastPage ?? false)) {
      _pagingController?.appendPage(movies ?? [], nextPageKey);
    }
  }

  //reset Pagination Controller
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
