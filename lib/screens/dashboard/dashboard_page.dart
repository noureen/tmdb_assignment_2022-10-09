import 'package:flutter/material.dart';
import 'package:the_movies_db_app/constants/constants.dart';
import 'package:the_movies_db_app/screens/dashboard/widgets/item_upcoming_movies.dart';
import 'package:the_movies_db_app/widgets/footer.dart';
import '../../blocs/upcoming_movies/upcoming_movies_bloc.dart';
import '../../data/model/upcoming_movies/upcoming_movies_model.dart';
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
  PagingController<int, UpcomingMoviesModel>? _pagingController;
  bool isLastPageLoaded = false;

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [HeaderAppBar(), Expanded(child: bodyContent)],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }

  Widget get bodyContent =>
      BlocListener<UpcomingMoviesBloc, UpcomingMoviesState>(
        listener: (context, state) {
          if (state is UpcomingMoviesInitState) {
            _fetchPage(true);
          } else if (state is ShowProgressState) {
            progress.showLoader(context);
          } else if (state is HideProgressState) {
            progress.hideLoader();
          } else if (state is UpcomingMoviesErrorState) {}
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          color:bodyGreyColor,
          child: BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
              builder: (BuildContext context, UpcomingMoviesState state) {
            if (state is LoadUpcomingMoviesState && _pagingController != null) {
              _updatePagination(
                  state.isLastPage, state.upcomingMovieList, state.nextPageKey);

              return PagedListView<int, UpcomingMoviesModel>(
                shrinkWrap: true,
                pagingController: _pagingController!,
                builderDelegate: PagedChildBuilderDelegate<UpcomingMoviesModel>(
                  itemBuilder: (context, item, index) {
                    final item = _pagingController?.itemList![index];

                    return MovieListItem(movie: item,);
                  },
                ),
              );
            }
            return _buildNoUpcomingMovies();
          }),
        ),
      );

  Widget _buildNoUpcomingMovies() => const SizedBox(
        child: Center(
          child: Text(AppStrings.strNoItemsFound),
        ),
      );

  _updatePagination(bool? isLastPage,
      List<UpcomingMoviesModel>? movies, int? nextPageKey) {
    if (nextPageKey == 2) {
      _resetPagination();
    }
    if ((isLastPage ?? false) && !isLastPageLoaded) {
      _pagingController?.appendLastPage(movies ?? []);
      isLastPageLoaded = true;
    } else if (!(isLastPage ?? false)) {
      _pagingController?.appendPage(movies ?? [], nextPageKey);
    }


  }

  _resetPagination() {
    isLastPageLoaded = false;
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
