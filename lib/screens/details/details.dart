import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:the_movies_db_app/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:the_movies_db_app/widgets/divider.dart';
import 'package:the_movies_db_app/screens/details/widgets/generes.dart';
import 'package:the_movies_db_app/screens/details/widgets/movie_image.dart';
import 'package:the_movies_db_app/screens/details/widgets/overview.dart';
import '../../constants/constants.dart';
import '../../data/model/movie_detail/movie_detail.dart';
import '../../main.dart';
import '../../styles/styles.dart';
import '../../utils/my_custom_scroll.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen();

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int? movieId;

  _getScreenData() {
    movieId = Get.arguments['movie_id'];
  }

  @override
  void initState() {
    super.initState();
    _getScreenData();
    BlocProvider.of<MovieDetailBloc>(context).add(MovieDetailInitEvent());
  }

  _fetchDetail() {
    BlocProvider.of<MovieDetailBloc>(context)
        .add(FetchMovieDetailEvent(movieId: movieId));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: WillPopScope(
        child: ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: BlocListener<MovieDetailBloc, MovieDetailState>(
                  listener: (context, state) {
                    if (state is MovieDetailInitState) {
                      _fetchDetail();
                    } else if (state is DetailShowProgressState) {
                      progress.showLoader(context);
                    } else if (state is DetailHideProgressState) {
                      progress.hideLoader();
                    }
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: bodyGreyColor,
                    child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
                        builder:
                            (BuildContext context, MovieDetailState state) {
                      if (state is LoadMovieDetailState) {
                        return _buildScrollContent(
                            state.movieDetail,
                            state.movieDetail?.backdropPath,
                            (state.moviesImages != null &&
                                    state.moviesImages?.logos != null &&
                                    (state.moviesImages?.logos?.isNotEmpty ??
                                        false))
                                ? state.moviesImages?.logos![1].filePath
                                : '',
                            state.movieDetail?.releaseDate);
                      } else if (state is MovieDetailErrorState) {
                        return noDetail;
                      }
                      return const SizedBox();
                    }),
                  ),
                ))),
        onWillPop: () async {
          Navigator.pop(context);
          return false;
        },
      ),
    ));
  }

  Widget get noDetail => SizedBox(
        child: Center(
          child: Text(
            strNoDetail,
            style: mediumTextMsgs,
          ),
        ),
      );

  _buildScrollContent(MovieDetail? movieDetail, String? backdropPath,
      String? logoPath, String? releaseDate) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return MediaQuery.of(context).orientation == Orientation.landscape
            ? _landscapeContent(
                movieDetail, backdropPath, logoPath, releaseDate)
            : _portraitContent(
                movieDetail, backdropPath, logoPath, releaseDate);
      },
    );
  }

  _portraitContent(
      MovieDetail? movie, String? backdrop, String? logo, String? releaseDate) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieImage(
            image: backdrop,
            releaseDate: releaseDate,
            logoPath: logo,
            trailerPath: (movie?.video ?? false)
                ? ''
                : 'https://www.youtube.com/watch?v=EngW7tLk6R8',
          ),
          Generes(
            genres: movie?.genres,
          ),
          if (movie?.overview != "") ...[
            const DividerLine(),
            OverView(
              overview: movie?.overview,
            )
          ]
        ],
      ),
    );
  }

  _landscapeContent(
      MovieDetail? movie, String? backdrop, String? logo, String? releaseDate) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieImage(
          image: backdrop,
          releaseDate: releaseDate,
          logoPath: logo,
          trailerPath: (movie?.video ?? false) ? '' : '',
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Generes(
              genres: movie?.genres,
            ),
            if (movie?.overview != "") ...[
              const DividerLine(),
              OverView(
                overview: movie?.overview,
              )
            ]
          ],
        ))
      ],
    );
  }
}
